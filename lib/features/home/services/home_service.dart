import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/services/api.dart';
import 'package:task_manager_app/models/task.dart';
import 'package:task_manager_app/providers/task_provider.dart';

class HomeService {
  void getAllTasks(String username, BuildContext context) async {
    (String?, dynamic) response =
        await getRequest('$baseUrl/getAllTasks/$username');
    if (response.$1 == null) {
      // if response.$1 (error) is null, then we have a successful response
      if (context.mounted) {
        int counter = 1;
        Map<String, dynamic> data = response.$2 as Map<String, dynamic>;
        List<Task> tasks = data['message'].map<Task>((e) {
          return Task.fromMap(e);
        }).toList();
        for (Task task in tasks) {
          task.counter = counter++;
        }
        context.read<TaskProvider>().tasks = tasks;
      }
    } else {
      // if response.$1 (error) is not null, then we have an error
      if (context.mounted) {
        context.showSnackBar(response.$1!);
      }
    }
  }
}
