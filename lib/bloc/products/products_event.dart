// ignore_for_file: must_be_immutable

part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

final class GetProductsEvent extends ProductsEvent {
  int page;

  GetProductsEvent({required this.page});
}
