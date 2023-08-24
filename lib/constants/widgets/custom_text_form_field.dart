import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.controller, required this.label});
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username Cannot be empty';
        }
        return null;
      },
      controller: controller,
      style: TextStyle(color: textColor),
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(color: textColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
