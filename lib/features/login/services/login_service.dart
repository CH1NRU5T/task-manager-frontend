import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/services/api.dart';
import 'package:task_manager_app/features/home/screens/home_screen.dart';
import 'package:task_manager_app/models/user.dart';
import 'package:task_manager_app/providers/user_provider.dart';

class LoginService {
  void _navigateToHomePage(BuildContext context, String username) {
    context.read<UserProvider>().setUser(User(username: username, tasks: []));
    Navigator.of(context).pushReplacementNamed(
      HomeScreen.routeName,
    );
  }

  void login(String username, BuildContext context) async {
    (String?, dynamic) response = await postRequest('$baseUrl/createUser', {
      'username': username,
    });
    if (response.$1 == null) {
      if (context.mounted) {
        _navigateToHomePage(context, username);
      }
    } else {
      if (context.mounted) {
        context.showSnackBar(response.$1!);
      }
    }
  }
}
