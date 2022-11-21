import 'package:product_app/boxes.dart';
import 'package:product_app/models/productmodel.dart';

class ProductOps {
  Future addProduct(
    String productName,
    double productPrice,
    double rating,
    String productImage,
  ) async {
    final productCardModel = ProductCardModel()
      ..productName = productName
      ..createdTime = DateTime.now()
      ..productImage = productImage
      ..productPrice = productPrice
      ..rating = rating
      ..id = 1;

    final box = Boxes.getProducts();
    box.add(productCardModel);
  }

  void editProduct(
    ProductCardModel productCardModel,
    String productName,
    double productPrice,
    double rating,
    String productImage,
  ) {
    productCardModel.productName = productName;
    productCardModel.productPrice = productPrice;
    productCardModel.rating = rating;
    productCardModel.productImage = productImage;

    productCardModel.save();
  }

  void deleteProduct(ProductCardModel productCardModel) {
    productCardModel.delete();
  }
}
