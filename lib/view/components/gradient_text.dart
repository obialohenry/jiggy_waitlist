import 'package:flutter/material.dart';

class GradienText extends StatelessWidget {
  const GradienText({
    Key? key,
    required this.gradient,
    required this.style,
    required this.text,
  }) : super(key: key);
  final Gradient gradient;
  final TextStyle? style;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(
          0,
          0,
          bounds.width,
          bounds.height,
        ),
      ),
      blendMode: BlendMode.srcIn,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
