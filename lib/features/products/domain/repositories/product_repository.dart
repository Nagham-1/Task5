import 'package:dartz/dartz.dart';
import 'package:task5/features/products/domain/entities/product.dart';
import 'package:task5/core/errors/failures.dart';

abstract class ProductRepository{
  Future<Either<Failure,List<Product>>> getAllProducts();
}