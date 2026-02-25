import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task5/features/products/presentation/cubit/product_cubit.dart';
import 'core/injectable/injection.dart';
import 'features/products/presentation/pages/products_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
          create: (_) => getIt<ProductCubit>(),
        child: const ProductsPage(),
      )
    );
  }
}