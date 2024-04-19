import 'package:flutter_task/bloc/products/products_bloc.dart';
import 'package:flutter_task/core/network/network_info.dart';
import 'package:flutter_task/data/data_sources/product_remote_data_source.dart';
import 'package:flutter_task/data/repositories/products_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final locator = GetIt.I;

Future<void> setup() async {
  //Presentation Layer
  locator.registerFactory<ProductsBloc>(
    () => ProductsBloc(
      productsRepository: locator<ProductsRepository>(),
    ),
  );

  //Repositories
  locator.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(
      productsRemoteDataSource: locator<ProductsRemoteDataSource>(),
      networkInfo: locator<NetworkInfo>(),
    ),
  );

  //Data Sources
  locator.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSource(),
  );

  //External
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker()),
  );
}
