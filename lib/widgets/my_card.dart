import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_app/models/productmodel.dart';
import 'package:product_app/operations/product_operations.dart';
import 'package:product_app/providers/cart_provider.dart';
import 'package:product_app/screens/editproduct_screen.dart';
import 'package:product_app/utils/time_ago.dart';
import 'package:product_app/widgets/button_dropdown.dart';
import 'package:provider/provider.dart';

class MyCard extends StatefulWidget {
  const MyCard({
    Key? key,
    required this.context,
    required this.productCardModel,
  }) : super(key: key);

  final BuildContext context;
  final ProductCardModel productCardModel;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    final time = timeAgo(widget.productCardModel.createdTime);
    final price = 'Rs. ${widget.productCardModel.productPrice}';
    final cart = Provider.of<CartProvider>(context);
    bool clicked = cart.items.contains(widget.productCardModel) ? true : false;

    List myItems = [
      TextButton.icon(
        label: const Text('Edit'),
        icon: const Icon(Icons.edit),
        style: TextButton.styleFrom(foregroundColor: Colors.green),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return EditProduct(productCardModel: widget.productCardModel);
              });
        },
      ),
      TextButton.icon(
        label: const Text('Delete'),
        icon: const Icon(Icons.delete),
        style: TextButton.styleFrom(foregroundColor: Colors.red),
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
                          ProductOps().deleteProduct(widget.productCardModel);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Delete')),
                  ],
                );
              });
        },
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
              widget.productCardModel.productImage,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/darkpage.jpg',
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.productCardModel.productName,
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
                  initialRating: widget.productCardModel.rating,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonDropDown(myItems: myItems),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (!clicked) {
                          clicked = !clicked;
                          cart.add(widget.productCardModel);
                        }
                      },
                      child: clicked
                          ? const Icon(Icons.done)
                          : const Icon(Icons.add_shopping_cart),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
