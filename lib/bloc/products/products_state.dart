// ignore_for_file: must_be_immutable

part of 'products_bloc.dart';

enum FetchingDataStates { initial, loading, success, failure, loadingPaginate }

class ProductsState extends Equatable {
  FetchingDataStates fetchingPrroductsState;
  List<Product> products;

  ProductsState({
    required this.fetchingPrroductsState,
    required this.products,
  });

  @override
  List<Object?> get props => [
        fetchingPrroductsState,
        products,
      ];

  ProductsState copyWith({
    FetchingDataStates? fetchingPrroductsState,
    List<Product>? products,
  }) {
    return ProductsState(
      fetchingPrroductsState:
          fetchingPrroductsState ?? this.fetchingPrroductsState,
      products: products ?? this.products,
    );
  }
}
