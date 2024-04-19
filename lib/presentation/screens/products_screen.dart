import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/bloc/products/products_bloc.dart';
import 'package:flutter_task/presentation/resources/app_colors.dart';
import 'package:flutter_task/presentation/widgets/products/product_card.dart';
import 'package:flutter_task/presentation/widgets/shared/body_text.dart';
import 'package:flutter_task/presentation/widgets/shared/loading_dialog.dart';
import 'package:flutter_task/presentation/widgets/shared/retry_button.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  ScrollController scrollController = ScrollController();
  int page = 0;

  @override
  void initState() {
    context.read<ProductsBloc>().add(GetProductsEvent(page: 0));
    scrollController.addListener(() {
      if (scrollController.offset ==
              scrollController.position.maxScrollExtent &&
          context.read<ProductsBloc>().state.fetchingPrroductsState !=
              FetchingDataStates.loadingPaginate) {
        page = page + 10;
        context.read<ProductsBloc>().add(GetProductsEvent(page: page));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Products",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontSize: 25.sp, color: AppColors.white),
      )),
      body: SafeArea(
        child: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {
            if (state.fetchingPrroductsState == FetchingDataStates.loading) {
              LoadingDialog.show(context);
            } else if (state.fetchingPrroductsState ==
                    FetchingDataStates.failure &&
                page == 0) {
              LoadingDialog.hide(context);
            } else if (state.fetchingPrroductsState ==
                    FetchingDataStates.success &&
                page == 0) {
              LoadingDialog.hide(context);
            }
          },
          builder: (context, state) {
            if (state.fetchingPrroductsState == FetchingDataStates.failure) {
              return Center(
                child: RetryButton(onTap: () {
                  context
                      .read<ProductsBloc>()
                      .add(GetProductsEvent(page: page));
                }),
              );
            }
            return state.products.isNotEmpty ||
                    state.fetchingPrroductsState == FetchingDataStates.loading
                ? ListView.separated(
                    shrinkWrap: true,
                    controller: scrollController,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    itemBuilder: (context, index) {
                      if (index == state.products.length) {
                        return state.fetchingPrroductsState ==
                                FetchingDataStates.loadingPaginate
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const SizedBox.shrink();
                      }
                      return ProductCard(product: state.products[index]);
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    itemCount: state.products.length + 1,
                  )
                : const Center(child: BodyText(text: 'No Data'));
          },
        ),
      ),
    );
  }
}
