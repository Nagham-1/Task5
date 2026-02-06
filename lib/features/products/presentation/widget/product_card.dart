import 'package:flutter/material.dart';
import 'package:task5/features/products/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),topRight: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 1.2,
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ]
              )
          )
        ],
      ),
    );
  }
}
