import 'package:dartz/dartz.dart';
import 'package:task5/core/errors/failures.dart';
import 'package:task5/features/products/domain/entities/product.dart';
import 'package:task5/features/products/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository productRepository;
  GetAllProducts({required this.productRepository});

  Future<Either<Failure,List<Product>>> call() async {
      return await productRepository.getAllProducts();
  }
}