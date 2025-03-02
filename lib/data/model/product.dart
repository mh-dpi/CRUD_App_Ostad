import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String Img;
  final String UnitPrice;
  final String ProductName;
  final int ProductCode;
  final String Qty;
  final String TotalPrice;
  final String id;

  const Product({
    required this.Img,
    required this.UnitPrice,
    required this.ProductName,
    required this.ProductCode,
    required this.Qty,
    required this.TotalPrice,
    required this.id,
  });

  Product copyWith({
    String? Img,
    String? UnitPrice,
    String? ProductName,
    int? ProductCode,
    String? Qty,
    String? TotalPrice,
    String? id,
  }) {
    return Product(
      Img: Img ?? this.Img,
      UnitPrice: UnitPrice ?? this.UnitPrice,
      ProductName: ProductName ?? this.ProductName,
      ProductCode: ProductCode ?? this.ProductCode,
      Qty: Qty ?? this.Qty,
      TotalPrice: TotalPrice ?? this.TotalPrice,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Img': this.Img,
      'UnitPrice': this.UnitPrice,
      'ProductName': this.ProductName,
      'ProductCode': this.ProductCode,
      'Qty': this.Qty,
      'TotalPrice': this.TotalPrice,
      '_id': this.id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      Img: map['Img'],
      UnitPrice: map['UnitPrice'].toString(),
      ProductName: map['ProductName'].toString(),
      ProductCode: map['ProductCode'],
      Qty: map['Qty'].toString(),
      TotalPrice: map['TotalPrice'].toString(),
      id: map['_id'].toString(),
    );
  }

  @override
  List<Object> get props =>
      [Img, UnitPrice, ProductName, ProductCode, Qty, TotalPrice, id,];
}
