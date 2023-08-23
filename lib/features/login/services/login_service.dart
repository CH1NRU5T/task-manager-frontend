import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/services/api.dart';
import 'package:task_manager_app/features/home/screens/home_screen.dart';

class LoginService {
  void _navigateToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  void login(String username, BuildContext context) async {
    (String?, dynamic) response =
        await getRequest('$baseUrl/getAllTasks/$username');
    if (response.$1 == null) {
      // no error
      print(response.$2);
      _navigateToHomePage(context);
    } else {
      //error
      print(response.$1);
    }
  }
}
