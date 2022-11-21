import 'package:hive/hive.dart';

part 'productmodel.g.dart';

@HiveType(typeId: 0)
class ProductCardModel extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String productName;

  @HiveField(2)
  late double productPrice;

  @HiveField(3)
  late String productImage;

  @HiveField(4)
  late double rating;

  @HiveField(5)
  late DateTime createdTime;
  // ProductCardModel({
  //   required this.id,
  //   required this.productName,
  //   required this.productPrice,
  //   required this.productImage,
  //   required this.rating,
  //   required this.createdTime,
  // });
}
