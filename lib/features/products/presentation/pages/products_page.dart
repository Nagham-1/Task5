import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task5/features/products/presentation/cubit/product_cubit.dart';
import 'package:task5/features/products/presentation/cubit/product_state.dart';
import 'package:task5/features/products/presentation/widget/product_card.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F4FF),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Products Store",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,),
        ),
        centerTitle: true,
      ),
      floatingActionButton: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          IconData icon;
          VoidCallback onPressed;
          if (state is ProductSuccess) {
            icon = Icons.add;
            onPressed = () {};
          } else {
            icon = Icons.download;
            onPressed = () {
              context.read<ProductCubit>().fetchProducts();
            };
          }
          return FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: Colors.blue,
            child: Icon(icon, color: Colors.white),
          );
        },
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(
                child: CircularProgressIndicator()
            );
          }
          if (state is ProductError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            );
          }
          if (state is ProductSuccess) {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: state.products[index]);
              },
            );
          }
          return const Center(
              child: Text("Press Button To Load",
                style: TextStyle(fontSize: 16,),));
        },
      ),
    );
  }
}