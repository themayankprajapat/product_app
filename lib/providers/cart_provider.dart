import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:product_app/models/productmodel.dart';

class CartProvider with ChangeNotifier {
  final List<ProductCardModel> _cartItems = [];
  int _counter = 0;
  int get counter => _counter;

// double _totalPrice=0.0;
// double get totalPrice=>_totalPrice;

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<ProductCardModel> get items =>
      UnmodifiableListView(_cartItems);
  void addCounter() {
    _counter++;
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    notifyListeners();
  }

  void add(ProductCardModel item) {
    addCounter();
    _cartItems.add(item);
    notifyListeners();
  }

  void remove(ProductCardModel item) {
    removeCounter();
    _cartItems.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _counter = 0;
    _cartItems.clear();
    notifyListeners();
  }
}
