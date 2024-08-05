import 'package:arre_demo/common/svg_image.dart';
import 'package:arre_demo/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String imagePath;
  final double? size;
  const CircularButton({required this.imagePath, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(size ?? 10),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                ColorConstants.yellow1,
                ColorConstants.yellow2,
                ColorConstants.yellow3,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: SvgImage(imagePath));
  }
}
