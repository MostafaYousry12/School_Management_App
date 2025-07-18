import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({required this.ButtomName, this.onTap, this.color});
  String? ButtomName;
  VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        width: double.infinity,
        height: 60,
        child: Center(child: Text(ButtomName!)),
      ),
    );
  }
}
