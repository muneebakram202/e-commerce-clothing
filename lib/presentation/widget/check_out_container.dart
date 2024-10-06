import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'my_text.dart';
import 'animated_text.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({
    super.key,
    required this.enableCheckout,
    required this.price,
  });

  final bool enableCheckout;
  final int price;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(
          horizontal: enableCheckout ? 50 : 164, vertical: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 66,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          if (enableCheckout)
            MyText(
              text: '\$$price.00',
              textColor: Colors.white,
              fontSize: 18,
            )
          else
            const Icon(Icons.lock, color: Colors.white),
          const Spacer(),
          if (enableCheckout)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFbdff61),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  const Icon(EvaIcons.shopping_bag_outline),
                  if (enableCheckout)
                    const AnimatedTypingText(
                      text: 'Check Out',
                      duration:  Duration(
                          milliseconds: 1000), // Adjust duration as needed
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
