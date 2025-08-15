import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput.CustomFormInput(
      {required this.hintText,
      this.onChange,
      this.icon,
      this.obscureText = false});
  String? hintText;
  Function(String)? onChange;
  bool obscureText;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "Field is Required";
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        errorBorder: customInputBorder(),
        focusedBorder: customInputBorder(),
        focusedErrorBorder: customInputBorder(),
        suffixIcon: icon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        enabledBorder: customInputBorder(),
      ),
    );
  }
}

InputBorder? customInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Colors.black,
    ),
  );
}
