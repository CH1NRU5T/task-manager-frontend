import 'package:flutter/material.dart';
import 'package:task_manager_app/features/home/screens/home_screen.dart';
import 'package:task_manager_app/features/login/screens/login_screen.dart';
import 'package:task_manager_app/features/task/screens/task_screen.dart';

generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        settings: settings,
      );
    case TaskScreen.routeName:
      Map<String, dynamic> taskArgs =
          settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => TaskScreen(
          task: taskArgs['task'],
        ),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        settings: settings,
      );
  }
}
