import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task5/core/network/dio_helper.dart';
import 'package:task5/core/network/network_info.dart';
import 'package:task5/features/products/data/datasources/product_remote_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:task5/features/products/data/repositories/product_repository_impl.dart';
import 'features/products/domain/repositories/product_repository.dart';
import 'features/products/domain/usecase/get_all_product.dart';

final sl = GetIt.instance;
Future<void> init() async {

  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() =>InternetConnectionChecker());

  // core
  sl.registerCachedFactory<DioHelper>(() => DioHelper());
  sl.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(connectionChecker: sl()),
  );

  // datasource
  sl.registerLazySingleton<ProductRemoteDataSource>(
        () => ProductRemoteDataSourceImpl(sl()),
  );

  // repositories
  sl.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(
      productRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // UseCase
  sl.registerLazySingleton(() => GetAllProducts(productRepository: sl()));

}