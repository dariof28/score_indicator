import 'package:flutter/material.dart';

/// A simple Dot with [radius] and [color].
class DotIndicator extends StatelessWidget {
  final double radius;
  final Color color;

  DotIndicator({required this.radius, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
