import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.progress,
    required this.taskNotCompletedColor,
    required this.taskCompletedColor,
  });

  final double progress;
  final Color taskNotCompletedColor;
  final Color taskCompletedColor;
  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = size.width / 15.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backGroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backGroundPaint);

    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskNotCompletedColor
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      progress * 2 * math.pi,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomTimerPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
