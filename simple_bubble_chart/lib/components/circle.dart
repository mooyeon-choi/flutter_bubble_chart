import 'dart:ui';

import 'package:flutter/material.dart';

class Circle {
  Circle(this.initialOffset, this.center, this.radius, this.color);

  final Offset initialOffset;
  final Offset center;
  final double radius;
  final Color color;
  Offset? _currentCenter;

  Offset getCenter(Animation<double> animation, List<Circle> otherCircles) {
    final dx = lerpDouble(initialOffset.dx, center.dx, animation.value);
    final dy = lerpDouble(initialOffset.dy, center.dy, animation.value);
    final newCenter = Offset(dx!, dy!);

    if (_currentCenter == null || !overlaps(newCenter, otherCircles)) {
      _currentCenter = newCenter;
    }

    return _currentCenter!;
  }

  bool overlaps(Offset newCenter, List<Circle> otherCircles) {
    for (final otherCircle in otherCircles) {
      if (otherCircle == this) continue;
      final distance = (newCenter - otherCircle.center).distance;
      if (distance < radius + otherCircle.radius) {
        return true;
      }
    }
    return false;
  }
}
