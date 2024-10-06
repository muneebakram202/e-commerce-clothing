import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  const MyText(
      {super.key,
        required this.text,
        this.textColor,
        this.fontSize,
        this.shadows,
        this.alignment,
        this.onClick,
        this.fontWeight = FontWeight.w400});

  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight fontWeight;
  final TextAlign? alignment;
  final Function()? onClick;
  final List<Shadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        text,
        textAlign: alignment,
        style: GoogleFonts.oswald(
            textStyle: TextStyle(
              color: textColor ?? Colors.black,
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight,
              shadows: shadows,
            )),
      ),
    );
  }
}
