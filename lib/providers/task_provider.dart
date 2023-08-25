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

  removeTaskById(String id) {
    int index = _tasks.indexWhere((task) => task.id == id);
    for (int i = index + 1; i < _tasks.length; i++) {
      _tasks[i].counter = _tasks[i].counter! - 1;
    }
    removeTask(index);
  }

  updateTask(String id, String newTitle, String newDescription) {
    for (Task task in _tasks) {
      if (task.id == id) {
        task.title = newTitle;
        task.description = newDescription;
        notifyListeners();
        break;
      }
    }
  }

  removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
