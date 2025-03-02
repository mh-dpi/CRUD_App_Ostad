import 'package:crud_app/data/model/product.dart';
import 'package:crud_app/presentation/ui/widgets/CustomAppBar.dart';
import 'package:crud_app/presentation/ui/widgets/custom_button.dart';
import 'package:crud_app/presentation/ui/widgets/product_input_field.dart';
import 'package:crud_app/state_management/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController codeController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController imageController = TextEditingController();
    final TextEditingController quantityController = TextEditingController();
    final TextEditingController unitPriceController = TextEditingController();

   
    return Scaffold(
      appBar: customAppBar("Add Product"),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                ProductInputField(
                  controller: nameController,
                  labelText: "Product Name",
                  hintText: "Enter product name",
                  prefixIcon: Icons.label,
                ),
                const SizedBox(height: 16),
                ProductInputField(
                  controller: codeController,
                  labelText: "Product Code",
                  hintText: "Enter product code",
                  prefixIcon: Icons.qr_code,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ProductInputField(
                  controller: imageController,
                  labelText: "Product Image URL",
                  hintText: "Enter product image URL",
                  prefixIcon: Icons.image,
                ),
                const SizedBox(height: 16),
                ProductInputField(
                  controller: quantityController,
                  labelText: "Product Quantity",
                  hintText: "Enter product quantity",
                  prefixIcon: Icons.confirmation_number,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                ProductInputField(
                  controller: unitPriceController,
                  labelText: "Product Unit Price",
                  hintText: "Enter product unit price",
                  prefixIcon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: "Total Price",
                    hintText: "Enter total price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.price_change),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    onClick: () {
                      context.read<CrudBloc>().add(AddProductEvent(Product(
                            ProductName: nameController.text,
                            ProductCode: int.parse(codeController.text),
                            TotalPrice: priceController.text,
                            Img: imageController.text,
                            Qty: quantityController.text,
                            UnitPrice: unitPriceController.text,
                            id: '',
                          )));
                      context.read<CrudBloc>().add(LoadProductEvent());
                      Get.back();
                    }, btnText: 'Add Product',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}


