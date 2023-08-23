import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/widgets/task_container.dart';
import 'package:task_manager_app/models/task.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  late List<Task> _tasks = [];
  static const String routeName = '/home';
  List<Task> getTasks(int zerone) {
    if (zerone == 0) {
      List<Task> oddTasks =
          _tasks.where((element) => element.counter % 2 == 1).toList();
      return oddTasks;
    } else {
      List<Task> evenTasks =
          _tasks.where((element) => element.counter % 2 == 0).toList();
      return evenTasks;
    }
  }

  @override
  Widget build(BuildContext context) {
    _tasks = ModalRoute.of(context)!.settings.arguments as List<Task>;
    List<Task> oddTasks = getTasks(0);
    List<Task> evenTasks = getTasks(1);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: oddTasks.map((e) {
                      return TaskContainer(
                        title: e.title,
                        description: e.description,
                      );
                    }).toList(),
                  ),
                ),
                10.width,
                Expanded(
                  child: Column(
                    children: evenTasks.map((e) {
                      return TaskContainer(
                        title: e.title,
                        description: e.description,
                      );
                    }).toList(),
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
