import 'package:crud_app/presentation/ui/pages/update_product.dart';
import 'package:crud_app/presentation/ui/pages/view_product.dart';
import 'package:crud_app/state_management/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String name, price, qty, total, unit, image, id;
  final int code,index;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: image.isNotEmpty
                  ? Image.network(
                      image,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image_not_supported,
                            size: 60, color: Colors.grey);
                      },
                    )
                  : Icon(Icons.image_not_supported,
                      size: 60, color: Colors.grey),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Quantity: $qty \nPrice: \$$unit",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.view_in_ar, color: Colors.green),
                  onPressed: () {
                    Get.to(() => ViewProduct(productId: index,));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blueAccent),
                  onPressed: () {
                    Get.to(() => UpdateProduct(
                          id: id,
                          name: name,
                          code: code.toInt(),
                          price: price,
                          quantity: qty,
                          unitPrice: unit,
                          image: image,
                        ));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                  onPressed: () {
                    context
                        .read<CrudBloc>()
                        .add(DeleteProductEvent(productId: id));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  const ProductCard({
    super.key,
    required this.name,
    required this.code,
    required this.price,
    required this.qty,
    required this.total,
    required this.unit,
    required this.image,
    required this.id, required this.index,
  });
}
