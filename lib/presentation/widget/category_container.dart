import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'my_text.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.categoryName,
    required this.categoryPrice,
    required this.categoryImage,
    required this.onTapFav,
    required this.isFav,
    required this.onTap,
  });

  final String categoryName;
  final String categoryPrice;
  final String categoryImage;
  final Function() onTapFav;
  final Function() onTap;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    categoryImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: onTapFav,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: isFav
                        ? const Icon(
                      TeenyIcons.heart,
                      size: 10,
                      color: Colors.red,
                    )
                        : const Icon(
                      OctIcons.heart,
                      size: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        MyText(
          text: categoryName,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        MyText(
          text: categoryPrice,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ],
    );
  }
}
