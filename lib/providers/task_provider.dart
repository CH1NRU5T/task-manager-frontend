import 'package:flutter/material.dart';
import 'package:task_manager_app/models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
  set tasks(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
