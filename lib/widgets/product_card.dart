import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 299,
        width: 169,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 165,
            width: 165,
            child: Image.asset(
              'darkpage.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'productname $index',
          ),
          const SizedBox(height: 10),
          const Text(
            'price',
          ),
          const SizedBox(height: 10),
          const Text('rating'),
          const SizedBox(height: 10),
          const Text('timestamp'),
        ]),
      ),
    );
  }
}
