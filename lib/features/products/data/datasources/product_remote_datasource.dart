import 'package:injectable/injectable.dart';
import 'package:task5/core/network/dio_helper.dart';
import 'package:task5/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<List<ProductModel>> getAllProducts();
}
@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
   final DioHelper dioHelper;
   ProductRemoteDataSourceImpl(this.dioHelper);

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final List<dynamic> data = await dioHelper.getData("products");
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
}