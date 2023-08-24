import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/features/login/screens/login_screen.dart';
import 'package:task_manager_app/providers/task_provider.dart';
import 'package:task_manager_app/providers/user_provider.dart';
import 'package:task_manager_app/router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => TaskProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
      ),
      home: const LoginScreen(),
      onGenerateRoute: (settings) {
        return generateRoute(settings);
      },
    );
  }
}
