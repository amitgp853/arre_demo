import 'package:arre_demo/common/svg_image.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String imagePath;
  final double? width;
  const ImageButton(this.imagePath, {this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: IconButton(
          onPressed: () {},
          icon: SvgImage(imagePath),
        ));
  }
}
