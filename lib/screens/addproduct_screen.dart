import 'package:flutter/material.dart';
import 'package:product_app/widgets/common_textfield.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: const Text(
          'Add New Product',
        ),
      ),
      body: Center(
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
            height: 327,
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Fill Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    CommonTextField(
                        controller: _productNameController,
                        validatorString: 'Please enter Product name',
                        labelText: 'Enter Product name'),
                    const SizedBox(height: 10),
                    CommonTextField(
                      controller: _productPriceController,
                      validatorString: 'Please enter Product price',
                      labelText: 'Enter Product price',
                    ),
                    const SizedBox(height: 64),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(174, 241, 241, 50),
                          shape: const StadiumBorder(),
                          minimumSize: const Size(169, 47),
                          side: const BorderSide(color: Colors.black),
                          elevation: 6),
                      child: const Text(
                        'Add',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
