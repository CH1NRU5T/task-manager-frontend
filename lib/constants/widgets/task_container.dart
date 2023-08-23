import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, this.title, required this.description});
  final String? title;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Wrap(
        children: [
          if (title != null)
            Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          const Divider(
            color: Colors.transparent,
          ),
          if (description != null)
            Text(
              description!,
              style: const TextStyle(fontSize: 15),
            ),
        ],
      ),
    );
  }
}
