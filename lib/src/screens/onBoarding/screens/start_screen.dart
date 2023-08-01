import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset('assets/img1.png'),
            ),
            20.heightBox,
            'Welcome to Devmare.\nLet\'s make your group stronger.'
                .text
                .white
                .align(TextAlign.center)
                .size(3.h)
                .semiBold
                .make(),
            20.heightBox,
          ],
        ),
        CustomButton(
          tabController: tabController,
          text: 'START',
          onTap: () => tabController.animateTo(tabController.index + 1),
        )
      ],
    ).pSymmetric(h: 30, v: 30);
  }
}
