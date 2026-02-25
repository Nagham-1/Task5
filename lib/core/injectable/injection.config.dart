// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:task5/core/injectable/injection.dart' as _i265;
import 'package:task5/core/network/dio_helper.dart' as _i1066;
import 'package:task5/core/network/network_info.dart' as _i299;
import 'package:task5/features/products/data/datasources/product_remote_datasource.dart'
    as _i707;
import 'package:task5/features/products/data/repositories/product_repository_impl.dart'
    as _i442;
import 'package:task5/features/products/domain/repositories/product_repository.dart'
    as _i840;
import 'package:task5/features/products/domain/usecase/get_all_product.dart'
    as _i814;
import 'package:task5/features/products/presentation/cubit/product_cubit.dart'
    as _i280;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => registerModule.connectionChecker);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i1066.DioHelper>(() => _i1066.DioHelper(gh<_i361.Dio>()));
    gh.lazySingleton<_i707.ProductRemoteDataSource>(
        () => _i707.ProductRemoteDataSourceImpl(gh<_i1066.DioHelper>()));
    gh.lazySingleton<_i299.NetworkInfo>(() => _i299.NetworkInfoImpl(
        connectionChecker: gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i840.ProductRepository>(() => _i442.ProductRepositoryImpl(
          productRemoteDataSource: gh<_i707.ProductRemoteDataSource>(),
          networkInfo: gh<_i299.NetworkInfo>(),
        ));
    gh.lazySingleton<_i814.GetAllProducts>(() =>
        _i814.GetAllProducts(productRepository: gh<_i840.ProductRepository>()));
    gh.factory<_i280.ProductCubit>(
        () => _i280.ProductCubit(gh<_i814.GetAllProducts>()));
    return this;
  }
}

class _$RegisterModule extends _i265.RegisterModule {}
