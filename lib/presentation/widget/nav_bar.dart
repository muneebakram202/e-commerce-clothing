import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key, required this.navIcon,
  }) : super(key: key);
  final List<NavigationIcon> navIcon;
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    double containerWidth = MediaQuery.of(context).size.width - 84;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 74,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            left: (containerWidth / widget.navIcon.length) * selectedIndex+2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Container(
              width: (containerWidth / widget.navIcon.length) ,
              height: 54,
              decoration: BoxDecoration(
                color: const Color(0xFFbdff61),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(widget.navIcon.length, (index) {
              return NavigationIcon(
                isSelected: selectedIndex == index,
                iconData: widget.navIcon[index].iconData,
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class NavigationIcon extends StatelessWidget {
  const NavigationIcon({
    super.key,
    required this.isSelected,
    required this.iconData,
    required this.onTap,
  });

  final bool isSelected;
  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        height: 54,
        child: Center(
          child: Icon(
            iconData,
            size: 22,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}

