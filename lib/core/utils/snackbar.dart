import 'package:flutter/material.dart';

void showsnackBar(BuildContext context, String massege) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massege),
    ),
  );
}
