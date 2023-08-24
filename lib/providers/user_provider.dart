import 'package:flutter/material.dart';
import 'package:task_manager_app/models/user.dart';

class UserProvider extends ChangeNotifier {
  late User? _user;

  User get user => _user!;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }

  logout() {
    _user = null;
  }

  String get username => _user!.username;
}
