import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:school_management_app/features/auth_feature/login_feature/presentation/view/widgets/top_wave_clip.dart';

class CustomClipPath extends StatelessWidget {
  const CustomClipPath({super.key, this.clipper, this.height});
  final CustomClipper<Path>? clipper;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        height: height,
        color: const Color(0xFF00C58D).withOpacity(.6),
      ),
    );
  }
}
