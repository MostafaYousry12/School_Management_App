import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CustomAwesomeDialog {
  static void show({
    required BuildContext context,
    required DialogType dialogType,
    required AnimType animType,
    String? title,
    String? desc,
    VoidCallback? btnOkOnPress,
    VoidCallback? btnCancelOnPress,
  }) {
    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: animType,
      title: title,
      desc: desc,
      btnOkOnPress: btnOkOnPress,
      btnCancelOnPress: btnCancelOnPress,
    ).show();
  }
}
