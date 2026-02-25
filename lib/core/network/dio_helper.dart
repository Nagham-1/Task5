import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task5/core/errors/exception.dart';

@LazySingleton()
class DioHelper{
  final Dio dio;
  DioHelper(this.dio);

  Future<List<dynamic>> getData(String endpoint) async{
    try{
      final response = await dio.get(endpoint);
      return response.data;
    } on DioException catch(e) {
      if (e.response != null) {
        throw ServerException();
      } else {
        throw NetworkException();
      }
    } catch(_) {
      throw UnExpectedException();
    }
  }
}
