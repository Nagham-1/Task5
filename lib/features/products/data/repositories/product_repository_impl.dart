import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task5/core/errors/exception.dart';
import 'package:task5/core/network/network_info.dart';
import 'package:task5/features/products/data/datasources/product_remote_datasource.dart';
import 'package:task5/features/products/domain/entities/product.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/repositories/product_repository.dart';

@LazySingleton( as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository{
  final ProductRemoteDataSource productRemoteDataSource;
  final NetworkInfo networkInfo;
  ProductRepositoryImpl({
    required this.productRemoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure,List<Product>>> getAllProducts() async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(message: "No Internet Connection"));
    }
    try {
      final products = await productRemoteDataSource.getAllProducts();
      return Right(products);
    } on ServerException {
      return const Left(ServerFailure(message: "Failed To Load Data From Server"));
    } on NetworkException {
      return const Left(NetworkFailure(message: "No Internet Connection"));
    } catch(_) {
      return const Left(UnExpectedFailure(message: "Something Went Wrong"));
    }
  }
}
