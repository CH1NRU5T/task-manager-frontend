import 'package:flutter/material.dart';
import 'package:task_manager_app/features/task/screens/task_screen.dart';
import 'package:task_manager_app/models/task.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          TaskScreen.routeName,
          arguments: {
            'title': task.title,
            'description': task.description,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Wrap(
          children: [
            if (task.title.isNotEmpty)
              Text(
                task.title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            const Divider(
              color: Colors.transparent,
            ),
            if (task.description.isNotEmpty)
              Text(
                task.description,
                style: const TextStyle(fontSize: 15),
              ),
          ],
        ),
      ),
    );
  }
}
