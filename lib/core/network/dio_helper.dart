import 'package:dio/dio.dart';
import 'package:task5/core/errors/exception.dart';

class DioHelper{
  static Dio dio=Dio(
    BaseOptions(
      baseUrl: "https://fakestoreapi.com/",
      connectTimeout : const Duration(seconds: 10),
      receiveTimeout : const Duration(seconds: 10),
      headers: {
        'Content-Type':'application/json',
      },
      receiveDataWhenStatusError: true,
    ),
  );
  static Future<List<dynamic>> getData(String endpoint) async{
    try{
      final response = await dio.get(endpoint);
      return response.data;
    } on DioException catch(e) {
      if (e.response != null) {
        throw ServerException();
      } else {
        throw NetworkException();
      }
    }
  }
}
