import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showBasicSnack(
      {required String msg, Color? color, required BuildContext context}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
      ),
    );
  }
}
