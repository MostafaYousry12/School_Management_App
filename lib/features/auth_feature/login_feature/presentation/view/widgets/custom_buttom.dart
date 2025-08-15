import 'package:flutter/material.dart';
import 'package:school_management_app/core/utils/styles.dart';

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
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
            child: Text(
          ButtomName!,
          style: Styles.textStyle16
              .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
        )),
      ),
    );
  }
}
