import 'package:flutter/material.dart';

class PaymentWidgetSelection extends StatelessWidget {
  const PaymentWidgetSelection({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.withOpacity(0.15),
        ),
        child: icon,
      ),
    );
  }
}
