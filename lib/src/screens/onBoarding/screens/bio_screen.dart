import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_container.dart';
import '../widgets/custom_text_header.dart';
import '../widgets/custom_textfield.dart';

class BioScreen extends StatelessWidget {
  final TabController tabController;
  const BioScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final bioController = TextEditingController();
    return Scaffold(
      backgroundColor: bgColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHeader(
                tabController: tabController,
                text: 'Describe Yourself as a Bit.',
              ),
              20.heightBox,
              CustomTextField(
                hint: 'Enter your bio..',
                // controller: bioController,
              ),
              40.heightBox,
              TextHeader(
                tabController: tabController,
                text: 'What\'s Your Skills?',
              ),
              20.heightBox,
              //! Skill options
              Row(
                children: [
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'Flutter',
                  ),
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'Web Dev',
                  ),
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'AI & ML',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'Android Dev',
                  ),
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'Cloud Dev',
                  ),
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'React',
                  ),
                ],
              ),
              Row(
                children: [
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'Java',
                  ),
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'Python',
                  ),
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'Devops',
                  ),
                  CustomTextContainer(
                    tabController: tabController,
                    text: 'UI & UX',
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const StepProgressIndicator(
                totalSteps: 6,
                currentStep: 5,
                selectedColor: accentColor,
              ),
              5.heightBox,
              CustomButton(
                tabController: tabController,
                text: 'NEXT STEP',
                onTap: () {
                  
                },
              ),
            ],
          ),
        ],
      ).pSymmetric(h: 30, v: 30),
    );
  }
}
