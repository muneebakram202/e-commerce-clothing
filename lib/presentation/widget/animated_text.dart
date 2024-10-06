import 'package:flutter/material.dart';

class AnimatedTypingText extends StatefulWidget {
  final String text;
  final Duration duration;

  const AnimatedTypingText({
    Key? key,
    required this.text,
    this.duration =
    const Duration(milliseconds: 1000), // Duration for full text
  }) : super(key: key);

  @override
  _AnimatedTypingTextState createState() => _AnimatedTypingTextState();
}

class _AnimatedTypingTextState extends State<AnimatedTypingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String displayedText = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0, end: widget.text.length.toDouble())
        .animate(_controller)
      ..addListener(() {
        setState(() {
          displayedText = widget.text.substring(0, _animation.value.toInt());
        });
      });
    Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      _controller.forward();
    });
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}