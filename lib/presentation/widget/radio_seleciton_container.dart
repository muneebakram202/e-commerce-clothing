import 'package:flutter/material.dart';

class RadioSelectionContainer extends StatelessWidget {
  const RadioSelectionContainer({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: isSelected ? const Color(0x00000000) : const Color(0xFFBDBDBD)),
            color: isSelected ? Colors.lightGreenAccent : null),
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
