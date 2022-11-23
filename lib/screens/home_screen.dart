import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_app/boxes.dart';
import 'package:product_app/models/productmodel.dart';
import 'package:product_app/screens/addproduct_screen.dart';
import 'package:product_app/screens/mycart_screen.dart';
import 'package:product_app/widgets/my_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product App'),
        actions: [
          IconButton(
            color: Colors.amber,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MyCart();
              }));
            },
            icon: const Icon(Icons.shopping_cart_checkout),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          dialogForm(context, const AddProductScreen());
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ValueListenableBuilder<Box<ProductCardModel>>(
        valueListenable: Boxes.getProducts().listenable(),
        builder: (BuildContext context, box, _) {
          final products = box.values.toList().cast<ProductCardModel>();
          return buildContent(products);
        },
      ),
    );
  }

  Widget buildContent(List<ProductCardModel> products) {
    if (products.isEmpty) {
      return Center(
        child: Text(
          'Nothing to show',
          style: Theme.of(context).textTheme.headline5,
        ),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 13 / 23,
          crossAxisCount: 2,
        ),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = products[index];
          return MyCard(context: context, productCardModel: product);
        },
      );
    }
  }

  Future<dynamic> dialogForm(BuildContext context, Widget child) {
    return showDialog(
        context: context,
        builder: (context) {
          return child;
        });
  }
}
