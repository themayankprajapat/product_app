import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_app/boxes.dart';
import 'package:product_app/models/productmodel.dart';
import 'package:product_app/operations/product_operations.dart';
import 'package:product_app/screens/addproduct_screen.dart';
import 'package:product_app/screens/editproduct_screen.dart';
import 'package:product_app/utils/time_ago.dart';
import 'package:product_app/widgets/button_dropdown.dart';
import 'package:product_app/widgets/common_textbuttonicon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product App'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddProductScreen();
              });
        },
        child: const Icon(Icons.add),
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
          return productList(context, product);
        },
      );
    }
  }

  Widget productList(BuildContext context, ProductCardModel productCardModel) {
    final time = timeAgo(productCardModel.createdTime);
    final price = 'Rs. ${productCardModel.productPrice}';
    List myItems = [
      CommonTextButtonIcon(
        label: 'Edit',
        icondata: Icons.edit,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return EditProduct(
                  productCardModel: productCardModel,
                );
              });
        },
        color: Colors.green,
      ),
      CommonTextButtonIcon(
        label: 'Delete',
        icondata: Icons.delete,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel')),
                    TextButton(
                        onPressed: () {
                          ProductOps().deleteProduct(productCardModel);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete')),
                  ],
                );
              });
        },
        color: Colors.red,
      ),
    ];
    return SizedBox(
      height: 299,
      width: 169,
      child: Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 165,
            child: Image.network(
              productCardModel.productImage,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/darkpage.jpg',
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  productCardModel.productName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 10),
                RatingBar.builder(
                  ignoreGestures: true,
                  itemSize: 20,
                  initialRating: productCardModel.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(height: 10),
                Text(
                  time,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                ButtonDropDown(myItems: myItems)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
