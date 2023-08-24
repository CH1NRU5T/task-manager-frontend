import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/services/api.dart';
import 'package:task_manager_app/models/task.dart';
import 'package:task_manager_app/providers/task_provider.dart';
import 'package:task_manager_app/providers/user_provider.dart';

class TaskService {
  createTask(
      {required BuildContext context,
      required String title,
      required String description}) async {
    Map<String, dynamic> body = {
      'username': context.read<UserProvider>().username,
      'title': title,
      'description': description
    };
    (String?, dynamic) response =
        await postRequest('$baseUrl/createTask', body);
    if (response.$1 == null) {
      if (context.mounted) {
        context.read<TaskProvider>().addTask(Task.fromMap(response.$2['task'])
            .copyWith(counter: context.read<TaskProvider>().tasks.length + 1));
        context.showSnackBar('Task created successfully');
        Navigator.pop(context);
      }
    } else {
      if (context.mounted) {
        context.showSnackBar(response.$1!);
      }
    }
  }

  deleteTask(BuildContext context, String id) async {
    Map<String, dynamic> body = {
      'username': context.read<UserProvider>().username,
      'id': id
    };
    (String?, dynamic) response =
        await deleteRequest('$baseUrl/deleteTask', body);
    if (response.$1 == null) {
      if (context.mounted) {
        context.read<TaskProvider>().removeTaskById(id);
        context.showSnackBar('Task deleted successfully');
        Navigator.pop(context);
      }
    } else {
      if (context.mounted) {
        context.showSnackBar(response.$1!);
      }
    }
  }

  updateTask(BuildContext context, String id, String newTitle,
      String newDescription, bool notify) async {
    Map<String, dynamic> body = {
      'username': context.read<UserProvider>().username,
      'id': id,
      'title': newTitle,
      'description': newDescription
    };
    (String?, dynamic) response =
        await updateRequest('$baseUrl/updateTask', body);
    if (response.$1 == null) {
      if (context.mounted) {
        context.read<TaskProvider>().updateTask(id, newTitle, newDescription);
        if (notify) {
          context.showSnackBar('Task updated successfully');
        }
      }
    } else {
      if (context.mounted) {
        context.showSnackBar(response.$1!);
      }
    }
  }
}
