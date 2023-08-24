import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/constants.dart';
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
            'task': task,
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
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            const Divider(
              color: Colors.transparent,
            ),
            if (task.description.isNotEmpty)
              Text(
                task.description,
                style: TextStyle(fontSize: 15, color: textColor),
              ),
          ],
        ),
      ),
    );
  }
}
