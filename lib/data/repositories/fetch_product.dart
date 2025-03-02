import 'dart:convert';
import 'package:crud_app/core/utils/urls.dart';
import 'package:crud_app/data/model/product.dart';
import 'package:http/http.dart' as http;
class Repository {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(Urls.readProduct));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> jsonData = jsonResponse['data'] ?? [];

      return jsonData.map((item) => Product.fromMap(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<bool> createProduct(Product product) async {

    final response = await http.post(
      Uri.parse(Urls.createProduct),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": product.ProductName,
        "ProductCode": int.parse(product.ProductCode.toString()),
        "Img": product.Img,
        "Qty": int.parse(product.Qty),
        "UnitPrice": int.parse(product.UnitPrice),
        "TotalPrice": int.parse(product.TotalPrice),
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create product');
    }
  }
  Future<bool> updateProduct(Product product) async {

    final response = await http.post(
      Uri.parse(Urls.updateProduct(product.id)),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "ProductName": product.ProductName,
        "ProductCode": int.parse(product.ProductCode.toString()),
        "Img": product.Img,
        "Qty": int.parse(product.Qty),
        "UnitPrice": int.parse(product.UnitPrice),
        "TotalPrice": int.parse(product.TotalPrice),
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to create product');
    }
  }

  Future<bool> deleteProduct(String id) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(id)));

    if (response.statusCode == 200) {
     return true;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
