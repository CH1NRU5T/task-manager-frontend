import 'dart:math';

import 'package:flutter/material.dart';

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
  int get random => Random().nextInt(toInt());
}

extension Snackbar on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 900),
        content: Text(message),
      ),
    );
  }
}
