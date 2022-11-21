import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_app/models/productmodel.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.index, required this.productCardModel});
  final int index;
  ProductCardModel productCardModel;

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
          Column(
            children: [
              Text(
                'productname',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 10),
              const Text(
                'price',
              ),
              const SizedBox(height: 10),
              RatingBar.builder(
                ignoreGestures: true,
                itemSize: 20,
                initialRating: 1,
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
                'timestamp',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
