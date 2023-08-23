import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/services/api.dart';
import 'package:task_manager_app/features/home/screens/home_screen.dart';
import 'package:task_manager_app/models/task.dart';

class LoginService {
  void _navigateToHomePage(BuildContext context, List<Task> tasks) {
    Navigator.of(context).pushReplacementNamed(
      HomeScreen.routeName,
      arguments: tasks,
    );
  }

  void login(String username, BuildContext context) async {
    (String?, dynamic) response =
        await getRequest('$baseUrl/getAllTasks/$username');
    if (response.$1 == null) {
      if (context.mounted) {
        int counter = 1;
        Map<String, dynamic> data = response.$2 as Map<String, dynamic>;
        List<Task> tasks = data['message'].map<Task>((e) {
          Map<String, dynamic> map = e as Map<String, dynamic>;
          map.addAll({'counter': counter++});
          print('mod: $map');
          return Task.fromMap(map);
        }).toList();
        _navigateToHomePage(context, tasks);
      }
    } else {
      if (context.mounted) {
        context.showSnackBar(response.$1!);
      }
    }
  }
}
