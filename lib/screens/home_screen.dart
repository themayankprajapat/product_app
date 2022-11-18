import 'package:flutter/material.dart';
import 'package:product_app/widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: Colors.blue,
          )
        ],
      ),
      body: const ProductCard(
        index: 1,
      ),
    );
  }
}
