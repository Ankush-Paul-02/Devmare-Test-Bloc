import 'package:flutter/material.dart';


class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    super.key,
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required this.icon,
    required this.hasGradient,
  });

  final double width, height, size;
  final Color color;
  final IconData icon;
  final bool hasGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
            ? const LinearGradient(colors: [Colors.black, Colors.red])
            : const LinearGradient(colors: [Colors.white, Colors.white]),
        boxShadow: [
          BoxShadow(
            spreadRadius: 4,
            blurRadius: 4,
            offset: const Offset(3, 3),
            color: Colors.grey.withAlpha(50),
          )
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
    );
  }
}
