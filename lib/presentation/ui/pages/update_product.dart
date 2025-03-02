import 'package:crud_app/data/model/product.dart';
import 'package:crud_app/presentation/ui/widgets/CustomAppBar.dart';
import 'package:crud_app/presentation/ui/widgets/custom_button.dart';
import 'package:crud_app/presentation/ui/widgets/product_text_field.dart';
import 'package:crud_app/state_management/bloc/crud_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class UpdateProduct extends StatelessWidget {
  final String id, name, price, image, quantity, unitPrice;
  final int code;

  const UpdateProduct({
    super.key,
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.image,
    required this.quantity,
    required this.unitPrice,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(text: name);
    final TextEditingController codeController = TextEditingController(text: code.toString());
    final TextEditingController priceController = TextEditingController(text: price);
    final TextEditingController imageController = TextEditingController(text: image);
    final TextEditingController quantityController = TextEditingController(text: quantity);
    final TextEditingController unitPriceController = TextEditingController(text: unitPrice);


    return Scaffold(
      appBar: customAppBar("Update Product"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  productTextField(nameController, "Product Name", Icons.label),
                  productTextField(codeController, "Product Code", Icons.qr_code, isNumeric: true),
                  productTextField(imageController, "Product Image URL", Icons.image),
                  productTextField(quantityController, "Product Quantity", Icons.confirmation_number, isNumeric: true),
                  productTextField(unitPriceController, "Product Unit Price", Icons.price_check, isNumeric: true),
                  productTextField(priceController, "Product Price", Icons.attach_money, isNumeric: true),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onClick: () {
                context.read<CrudBloc>().add(UpdateProductEvent(Product(
                  id: id,
                  ProductName: nameController.text,
                  ProductCode: int.parse(codeController.text),
                  TotalPrice: priceController.text,
                  Img: imageController.text,
                  Qty: quantityController.text,
                  UnitPrice: unitPriceController.text,
                )));
                context.read<CrudBloc>().add(LoadProductEvent());
                Get.back();
              },
              btnText: "Update Product",
            ),
          ],
        ),
      ),
    );
  }


}
