import 'package:flutter/material.dart';
import 'package:product_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.amber,
          ),
        ),
        title: const Text('My Cart'),
      ),
      body: SingleChildScrollView(
        child: Consumer<CartProvider>(
          builder: (context, cart, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total Products ${cart.counter}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    label: const Text('Empty my Cart'),
                    icon: const Icon(Icons.remove_shopping_cart_outlined),
                    onPressed: () {
                      cart.removeAll();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                itemCount: cart.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.network(
                          cart.items[index].productImage,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/darkpage.jpg',
                            fit: BoxFit.cover,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        cart.items[index].productName,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        'Rs. ${cart.items[index].productPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            cart.remove(cart.items[index]);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.black,
                    indent: 10,
                    endIndent: 15,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
