import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/services/api.dart';
import 'package:task_manager_app/providers/task_provider.dart';
import 'package:task_manager_app/providers/user_provider.dart';

class TaskService {
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
      String newDescription) async {
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
        context.showSnackBar('Task updated successfully');
      }
    } else {
      if (context.mounted) {
        context.showSnackBar(response.$1!);
      }
    }
  }
}
