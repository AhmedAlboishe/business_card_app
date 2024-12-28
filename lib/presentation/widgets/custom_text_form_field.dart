import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.isNumber = false,
  });
  final String label;
  final TextEditingController controller;
  final bool isNumber;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value != null && value.trim().isEmpty) {
          return 'Plase enter your $label';
        }
        return null;
      },
      keyboardType: isNumber ? TextInputType.number : null,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
