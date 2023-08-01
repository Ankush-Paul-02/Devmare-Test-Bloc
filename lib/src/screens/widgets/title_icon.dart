import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/colors.dart';

class TitleWithIcon extends StatelessWidget {
  const TitleWithIcon({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title.text.headline5(context).white.make(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: grey,
          ),
        ),
      ],
    );
  }
}