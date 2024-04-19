import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/router/app_routes.dart';
import 'package:flutter_task/data/models/product_model.dart';
import 'package:flutter_task/presentation/resources/app_colors.dart';
import 'package:flutter_task/presentation/widgets/products/product_ratingbar.dart';
import 'package:flutter_task/presentation/widgets/shared/body_text.dart';
import 'package:flutter_task/presentation/widgets/shared/section_title.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.pushNamed(AppRoutes.prodcutDetailsScreen, extra: product),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.lightCyan,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 90.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  color: AppColors.paleBlue,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: CachedNetworkImage(
                    imageUrl: product.thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionTitle(title: product.title),
                  SizedBox(height: 5.h),
                  BodyText(text: product.price.toString()),
                  SizedBox(height: 5.h),
                  ProductRatingBar(rate: product.rating),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
