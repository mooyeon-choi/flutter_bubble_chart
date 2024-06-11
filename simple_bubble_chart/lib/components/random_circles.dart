import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_bubble_chart/components/circle.dart';

class RandomCircles extends CustomPainter {
  RandomCircles(this.animation) : super(repaint: animation);

  final Animation<double> animation;
  final Random _random = Random();
  final List<Circle> _circles = [];

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    for (var i = 0; i < 10; i++) {
      if (_circles.length >= 20) {
        break;
      }

      final radius = min(_random.nextDouble() * size.width / 25, 100.0);
      final initialOffset = Offset(
        center.dx + (_random.nextDouble() - 0.5) * size.width,
        center.dy + (_random.nextDouble() - 0.5) * size.height,
      );

      final newCircle = Circle(
          initialOffset, center, radius, Color(_random.nextInt(0xFFFFFFFF)));

      if (_circles.every((circle) => !circle.overlaps(
          newCircle.getCenter(animation, _circles), _circles))) {
        _circles.add(newCircle);
      }
    }

    for (final circle in _circles) {
      final paint = Paint()..color = circle.color;
      final currentCenter = circle.getCenter(animation, _circles);
      canvas.drawCircle(currentCenter, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
