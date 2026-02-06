import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task5/features/products/domain/usecase/get_all_product.dart';
import 'package:task5/features/products/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState>{
  final GetAllProducts getAllProducts;

  ProductCubit(this.getAllProducts) : super(ProductInitial());
  void fetchProducts() async {
    emit(ProductLoading());
    final result  = await getAllProducts();
    result.fold(
            (failure) {
              emit(ProductError(failure.message));
              },
            (products) {
              emit(ProductSuccess(products));
            },
    );
  }
}