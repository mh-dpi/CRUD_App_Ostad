import 'package:crud_app/presentation/ui/pages/update_product.dart';
import 'package:crud_app/presentation/ui/widgets/CustomAppBar.dart';
import 'package:crud_app/presentation/ui/widgets/product_detail_row.dart';
import 'package:crud_app/state_management/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ViewProduct extends StatelessWidget {
  final int productId;

  const ViewProduct({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("View Product"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CrudBloc, CrudState>(
          builder: (context, state) {
            if (state is CrudUpdateState) {
              final product = state.products[productId];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 8,
                color: Colors.purple[50],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product.Img,
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image_not_supported,
                                  size: 150, color: Colors.grey);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        product.ProductName,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 8),
                      productDetailRow("Product Code", product.ProductCode.toString()),
                      productDetailRow("Unit Price", "\$${product.UnitPrice}"),
                      productDetailRow("Quantity", product.Qty),
                      productDetailRow("Total Price", "\$${product.TotalPrice}"),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.to(() => UpdateProduct(
                                id: product.id,
                                name: product.ProductName,
                                code: product.ProductCode.toInt(),
                                price: product.TotalPrice,
                                quantity: product.Qty,
                                unitPrice: product.UnitPrice,
                                image: product.Img,
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                            ),
                            child: const Text("Edit"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<CrudBloc>()
                                  .add(DeleteProductEvent(productId: product.id));
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                            ),
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is CrudErrorState) {
              return Center(child: Text("Error: ${state.errorMessages}"));
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }


}