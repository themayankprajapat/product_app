import 'package:hive/hive.dart';
import 'package:product_app/models/productmodel.dart';

class Boxes{
  static  Box<ProductCardModel>getProducts()=>Hive.box<ProductCardModel>('productcardmodel');
}