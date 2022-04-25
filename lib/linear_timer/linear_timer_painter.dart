import 'package:flutter/material.dart';

class CustomLinearTimerPainter extends CustomPainter {
  CustomLinearTimerPainter({
    required this.progress,
    required this.displayBackground,
    required this.taskNotCompletedColor,
    required this.taskCompletedColor,
  });

  final double progress;
  final bool displayBackground;
  final Color taskNotCompletedColor;
  final Color taskCompletedColor;
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 5.0;
    const strokeBackgroundWidth = 30.0;
    final backGroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskNotCompletedColor
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      backGroundPaint,
    );

    final foregroundPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..color = taskCompletedColor
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width * (1 - progress), size.height / 2),
      foregroundPaint,
    );
    final foregroundContentPaint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeBackgroundWidth
      ..color = displayBackground ? taskCompletedColor : Colors.transparent
      ..style = PaintingStyle.stroke;
    canvas.drawLine(
      Offset(0, (size.height / 2) + strokeBackgroundWidth / 2),
      Offset(
        size.width,
        (size.height / 2) + strokeBackgroundWidth / 2,
      ),
      foregroundContentPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomLinearTimerPainter oldDelegate) {
    return progress != oldDelegate.progress;
  }
}
