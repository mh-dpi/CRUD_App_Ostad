import 'package:flutter/material.dart';

class ProductInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText, hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(prefixIcon),
      ),
      keyboardType: keyboardType,
    );
  }

  const ProductInputField({super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,  this.keyboardType=TextInputType.text,
  });
}
