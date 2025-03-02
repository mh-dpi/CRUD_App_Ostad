import 'package:crud_app/presentation/ui/pages/update_product.dart';
import 'package:crud_app/presentation/ui/pages/view_product.dart';
import 'package:crud_app/state_management/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String name, price, qty, total, unit, image, id;
  final int code, index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ViewProduct(
              productId: index,
            ));
      },
      child: Card(
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
                    icon: Icon(Icons.view_carousel,
                        size: 50, color: Colors.green),
                    onPressed: () {
                      Get.to(() => ViewProduct(
                            productId: index,
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
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
    required this.id,
    required this.index,
  });
}
