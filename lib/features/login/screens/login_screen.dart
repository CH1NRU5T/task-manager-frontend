import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/widgets/custom_text_form_field.dart';
import 'package:task_manager_app/features/login/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _usernameController;
  late LoginService _loginService;
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _loginService = LoginService();
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: _usernameController,
                label: 'Enter your Username',
              ),
              20.height,
              TextButton(
                style: TextButton.styleFrom(backgroundColor: fabColor),
                child: Text(
                  'Login',
                  style: TextStyle(color: textColor),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _loginService.login(_usernameController.text, context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
