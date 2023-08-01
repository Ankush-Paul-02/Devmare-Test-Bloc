import 'package:devmate/src/bloc/onBoarding/on_boarding_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_container.dart';
import '../widgets/custom_text_header.dart';

class PictureScreen extends StatelessWidget {
  final TabController tabController;

  const PictureScreen({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnBoardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const CircularProgressIndicator(color: bgColor1).centered();
        }
        if (state is OnboardingLoaded) {
          var images = state.user.imageUrls;
          var imageCount = images.length;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHeader(
                    text: 'Add 2 or More Pictures',
                    tabController: tabController,
                  ),
                  30.heightBox,
                  SizedBox(
                    height: 350,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.66,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return (imageCount > index)
                            ? CustomImageContainer(
                                imageUrl: images[index],
                              )
                            : const CustomImageContainer();
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 4,
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
