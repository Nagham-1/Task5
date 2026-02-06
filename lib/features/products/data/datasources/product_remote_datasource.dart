import 'package:task5/core/network/dio_helper.dart';
import 'package:task5/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<List<ProductModel>> getAllProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final List<dynamic> data = await DioHelper.getData("products");
    return data.map((item) => ProductModel.fromJson(item)).toList();
  }
}