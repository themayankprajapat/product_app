// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCardModelAdapter extends TypeAdapter<ProductCardModel> {
  @override
  final int typeId = 0;

  @override
  ProductCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCardModel()
      ..id = fields[0] as int
      ..productName = fields[1] as String
      ..productPrice = fields[2] as double
      ..productImage = fields[3] as String
      ..rating = fields[4] as double
      ..createdTime = fields[5] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ProductCardModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productPrice)
      ..writeByte(3)
      ..write(obj.productImage)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.createdTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
