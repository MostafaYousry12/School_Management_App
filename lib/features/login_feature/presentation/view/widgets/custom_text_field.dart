import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput.CustomFormInput(
      {required this.hintText, this.onChange, this.icon});
  String? hintText;
  Function(String)? onChange;

  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
