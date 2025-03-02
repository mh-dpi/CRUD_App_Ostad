import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onClick;
  final String btnText;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
        shadowColor: shadowColor,
      ),
      child: Text(btnText, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  const CustomButton({
    super.key,
    required this.onClick,
    required this.btnText,
    this.backgroundColor = Colors.blueAccent,
    this.foregroundColor = Colors.white,
    this.shadowColor = Colors.blueAccent,
  });
}
