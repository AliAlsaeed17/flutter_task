import 'package:dartz/dartz.dart';
import 'package:flutter_task/core/classes/exceptions.dart';
import 'package:flutter_task/core/classes/failures.dart';
import 'package:flutter_task/core/network/network_info.dart';
import 'package:flutter_task/data/data_sources/product_remote_data_source.dart';
import 'package:flutter_task/data/models/product_model.dart';

class ProductsRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;
  final NetworkInfo _networkInfo;

  ProductsRepository(
      {required ProductsRemoteDataSource productsRemoteDataSource,
      required NetworkInfo networkInfo})
      : _productsRemoteDataSource = productsRemoteDataSource,
        _networkInfo = networkInfo;

  Future<Either<Failure, List<Product>>> getProducts(
      {required int skip}) async {
    if (await _networkInfo.isConnected) {
      try {
        final result = await _productsRemoteDataSource.getProducts(skip: skip);
        List<Product> products = [];
        for (var productMap in result['products']) {
          products.add(Product.fromJson(productMap));
        }
        return Right(products);
      } on ServerException catch (failure) {
        return left(ServerFailure(message: failure.message.toString()));
      }
    } else {
      return left(const ServerFailure(message: 'No Internet Connection'));
    }
  }
}
