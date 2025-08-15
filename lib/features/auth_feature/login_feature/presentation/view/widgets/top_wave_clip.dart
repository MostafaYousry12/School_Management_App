import 'dart:ui';

import 'package:flutter/material.dart';

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(size.width, 0); // start from top-right
    path.lineTo(size.width, size.height * 0.4);

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.4,
    );

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.2,
      0,
      size.height * 0.4,
    );

    path.lineTo(0, 0); // close to top-left
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
