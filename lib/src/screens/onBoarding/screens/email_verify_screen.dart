import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';
import '../widgets/widgets.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextHeader(
              tabController: tabController,
              text: 'Did You Get the Verification Code?',
            ),
            30.heightBox,
            CustomTextField(
              hint: 'Enter your code..',
              // controller: codeController,
            ),
          ],
        ),
        Column(
          children: [
            const StepProgressIndicator(
              totalSteps: 6,
              currentStep: 2,
              selectedColor: accentColor,
            ),
            5.heightBox,
            CustomButton(
              tabController: tabController,
              text: 'NEXT STEP',
              onTap: () {},
            ),
          ],
        ),
      ],
    ).pSymmetric(h: 30, v: 30);
  }
}
