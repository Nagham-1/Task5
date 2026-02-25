import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
    Dio dio() => Dio(
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

  @lazySingleton
  InternetConnectionChecker get connectionChecker =>InternetConnectionChecker();
}