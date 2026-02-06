import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task5/core/network/network_info.dart';
import 'features/products/data/datasources/product_remote_datasource.dart';
import 'features/products/data/repositories/product_repository_impl.dart';
import 'features/products/domain/usecase/get_all_product.dart';
import 'features/products/presentation/cubit/product_cubit.dart';
import 'features/products/presentation/pages/products_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final networkInfo = NetworkInfoImpl(
        connectionChecker: InternetConnectionChecker());
    final repository = ProductRepositoryImpl(
        ProductRemoteDataSourceImpl(),
        networkInfo);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductCubit(GetAllProducts(repository)),
        child: const ProductsPage(),
      ),
    );
  }
}