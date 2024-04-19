// ignore_for_file: depend_on_referenced_packages, prefer_const_literals_to_create_immutables

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_task/data/models/product_model.dart';
import 'package:flutter_task/data/repositories/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository _productsRepository;
  final int skip = 10;

  ProductsBloc({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(ProductsState(
          fetchingPrroductsState: FetchingDataStates.initial,
          products: [],
        )) {
    on<GetProductsEvent>((event, emit) async {
      emit(state.copyWith(
          fetchingPrroductsState: event.page == 0
              ? FetchingDataStates.loading
              : FetchingDataStates.loadingPaginate));
      try {
        var result = await _productsRepository.getProducts(skip: event.page);
        result.fold(
          (failure) {
            emit(state.copyWith(
                fetchingPrroductsState: FetchingDataStates.failure));
          },
          (products) {
            List<Product> productsList = state.products.toList();
            if (event.page == 0) {
              productsList = [];
            }
            productsList.addAll(products);
            emit(state.copyWith(
                fetchingPrroductsState: FetchingDataStates.success,
                products: productsList));
          },
        );
      } catch (e) {
        emit(
            state.copyWith(fetchingPrroductsState: FetchingDataStates.failure));
      }
    });
  }
}
