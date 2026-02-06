import 'package:equatable/equatable.dart';
import 'package:task5/features/products/domain/entities/product.dart';

abstract class ProductState extends Equatable{}

class ProductInitial extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState{
  @override
  List<Object?> get props => [];
}

class ProductSuccess extends ProductState{
  final List<Product> products;
  ProductSuccess(this.products);

  @override
  List<Object?> get props => [];
}
class ProductError extends ProductState{
  final String message;
  ProductError(this.message);

  @override
  List<Object?> get props => [];
}