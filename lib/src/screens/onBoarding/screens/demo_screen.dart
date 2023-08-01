import 'package:devmate/src/bloc/blocks.dart';
import 'package:devmate/src/screens/onBoarding/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_text_header.dart';

class DemoScreen extends StatelessWidget {
  final TabController tabController;

  const DemoScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnBoardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const CircularProgressIndicator(color: bgColor1).centered();
        }
        if (state is OnboardingLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeader(
                        tabController: tabController,
                        text: 'What\'s Your Gender?',
                      ),
                      10.heightBox,
                      CustomCheckBox(
                        // tabController: tabController,
                        text: 'MALE',
                        value: state.user.gender == 'Male',
                        onChanged: (newValue) {
                          context.read<OnboardingBloc>().add(
                                UpdateUser(
                                  user: state.user.copyWith(
                                    gender: 'Male',
                                  ),
                                ),
                              );
                        },
                      ),
                      5.heightBox,
                      CustomCheckBox(
                        // tabController: tabController,
                        text: 'FEMALE',
                        value: state.user.gender == 'Female',
                        onChanged: (newValue) {
                          context.read<OnboardingBloc>().add(
                                UpdateUser(
                                  user: state.user.copyWith(
                                    gender: 'Female',
                                  ),
                                ),
                              );
                        },
                      ),
                      100.heightBox,
                      TextHeader(
                        tabController: tabController,
                        text: 'What\'s Your Age?',
                      ),
                      20.heightBox,
                      CustomTextField(
                        hint: 'Enter your age...',
                        onChanged: (value) {
                          context.read<OnboardingBloc>().add(
                            UpdateUser(
                              user: state.user.copyWith(age: int.parse(value)),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  const StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 3,
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
        } else {
          return 'Something went wrong!'.text.white.semiBold.size(14).make();
        }
      },
    );
  }
}
