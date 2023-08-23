import 'package:flutter/material.dart';
import 'package:task_manager_app/features/home/screens/home_screen.dart';
import 'package:task_manager_app/features/login/screens/login_screen.dart';

generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        settings: settings,
      );
  }
}
