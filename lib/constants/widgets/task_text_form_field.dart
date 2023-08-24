import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/constants.dart';

class TaskTextFormField extends StatelessWidget {
  const TaskTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.desc,
    required this.onChanged,
  });
  final TextEditingController controller;
  final bool desc;
  final String label;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (_) => onChanged(),
      keyboardType: TextInputType.multiline,
      maxLines: desc ? null : 1,
      controller: controller,
      style: TextStyle(
          fontSize: desc ? 15 : 16,
          color: textColor,
          fontWeight: desc ? FontWeight.normal : FontWeight.bold),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
            fontSize: desc ? 15 : 16,
            color: textColor,
            fontWeight: desc ? FontWeight.normal : FontWeight.bold),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
