import 'package:devmate/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomCheckBox extends StatelessWidget {
  final TabController? tabController;
  final String text;
  final bool value;
  final Function(bool?) onChanged;

  const CustomCheckBox({
    super.key,
    this.tabController,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: CircleBorder(
            side: BorderSide(
              color: blueGrey
            )
          ),
          value: value,
          onChanged: onChanged,
          checkColor: bgColor1,
          activeColor: bgColor,

        ),
        text.text.normal.headline6(context).white.make()
      ],
    );
  }
}
