import 'dart:math';

import 'package:flutter/material.dart';

class CircularText extends StatefulWidget {
  final String text;
  final int repetitions;
  final double radius;

  const CircularText({
    super.key,
    required this.text,
    required this.repetitions,
    required this.radius,
  });

  @override
  _CircularTextState createState() => _CircularTextState();
}

class _CircularTextState extends State<CircularText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: CustomPaint(
            size: Size(widget.radius * 2, widget.radius * 2),
            painter: CircularTextPainter(
              text: widget.text,
              repetitions: widget.repetitions,
              radius: widget.radius,
            ),
          ),
        );
      },
    );
  }
}

class CircularTextPainter extends CustomPainter {
  final String text;
  final int repetitions;
  final double radius;

  CircularTextPainter(
      {required this.text, required this.repetitions, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = radius;
    final double centerY = radius;

    final Paint paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);

    int totalCharacters = text.length * repetitions;
    final double anglePerChar = 2 * pi / totalCharacters;

    for (int i = 0; i < totalCharacters; i++) {
      String character = text[i % text.length];

      double angle = anglePerChar * i - pi / 2;

      double x = centerX + radius * cos(angle);
      double y = centerY + radius * sin(angle);

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: character,
          style: const TextStyle(
              color: Colors.black, fontSize: 10, fontWeight: FontWeight.w700),
        ),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      canvas.save();
      canvas.translate(x, y);
      canvas.rotate(angle + pi / 2);
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CircularTextPainter oldDelegate) {
    return oldDelegate.text != text ||
        oldDelegate.repetitions != repetitions ||
        oldDelegate.radius != radius;
  }
}