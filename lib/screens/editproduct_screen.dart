import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:product_app/models/productmodel.dart';
import 'package:product_app/operations/product_operations.dart';
import 'package:product_app/widgets/common_textfield.dart';

class EditProduct extends StatefulWidget {
  final ProductCardModel productCardModel;

  const EditProduct({super.key, required this.productCardModel});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();
  final _productImageController = TextEditingController();
  double? ratingValue;

  @override
  void initState() {
    super.initState();
    final productCardModel = widget.productCardModel;
    _productNameController.text = productCardModel.productName;
    _productPriceController.text =
        productCardModel.productPrice.round().toString();
    _productImageController.text = productCardModel.productImage;
    ratingValue = productCardModel.rating;
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productPriceController.dispose();
    _productImageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          color: const Color.fromARGB(255, 245, 231, 101),
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 34,
              vertical: 20,
            ),
            width: 358,
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Edit Product details',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                      controller: _productNameController,
                      labelText: 'Enter Product name',
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 10),
                    CommonTextField(
                      controller: _productPriceController,
                      labelText: 'Enter Product price',
                      textInputFormatter:
                          FilteringTextInputFormatter.digitsOnly,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    CommonTextField(
                      controller: _productImageController,
                      labelText: 'Enter Product Image Url',
                      keyboardType: TextInputType.url,
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: ratingValue!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          ratingValue = rating;
                        });
                        {}
                      },
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ProductOps().editProduct(
                              widget.productCardModel,
                              _productNameController.text,
                              double.parse(_productPriceController.text),
                              ratingValue!,
                              _productImageController.text);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Saved'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(174, 241, 241, 50),
                          shape: const StadiumBorder(),
                          minimumSize: const Size(169, 47),
                          side: const BorderSide(color: Colors.black),
                          elevation: 6),
                      child: Text('Save',
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
