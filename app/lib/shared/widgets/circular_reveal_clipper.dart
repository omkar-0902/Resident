import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset? center;

  CircularRevealClipper({required this.fraction, this.center});

  @override
  Path getClip(Size size) {
    final center = this.center ?? Offset(size.width, 0);
    final maxRadius = math.sqrt(size.width * size.width + size.height * size.height);
    final radius = maxRadius * fraction;

    return Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(covariant CircularRevealClipper oldClipper) {
    return fraction != oldClipper.fraction || center != oldClipper.center;
  }
}
