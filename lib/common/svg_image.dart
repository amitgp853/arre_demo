import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  final double? height;
  final double? width;
  const SvgImage(this.path, {this.fit, this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      fit: fit ?? BoxFit.contain,
      height: height,
      width: width,
    );
  }
}
