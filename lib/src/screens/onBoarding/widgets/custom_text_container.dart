import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';

class CustomTextContainer extends StatelessWidget {
  final TabController? tabController;
  final String text;
  const CustomTextContainer({
    super.key,
    this.tabController,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            primaryColor,
            accentColor,
          ],
        ),
      ),
      child: text.text.white.size(16).semiBold.make().centered(),
    ).pOnly(top: 10, right: 10);
  }
}
