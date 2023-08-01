import 'package:devmate/src/cubits/signup_cubit.dart';
import 'package:devmate/src/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_header.dart';
import '../widgets/custom_textfield.dart';

class EmailScreen extends StatelessWidget {
  final TabController tabController;

  EmailScreen({super.key, required this.tabController});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void signUp() async {
    if (emailController.text.isNotEmptyAndNotNull &&
        passwordController.text.isNotEmptyAndNotNull) {
      AuthRepository(firebaseAuth: FirebaseAuth.instance).signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      tabController.animateTo(tabController.index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) => Scaffold(
        backgroundColor: bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TextHeader(
                text: 'What\'s Your Email Address?',
              ),
              20.heightBox,
              CustomTextField(
                hint: 'Enter your email...',
                onChanged: (value) {
                  context.read<SignupCubit>().emailChanged(value);
                  print(state.email);
                },
              ),
              100.heightBox,
              const TextHeader(
                text: 'Choose Your Password',
              ),
              20.heightBox,
              CustomTextField(
                hint: 'Enter your password...',
                onChanged: (value) {
                  context.read<SignupCubit>().passwordChanged(value);
                  print(state.email);
                },
              ),
            ]).scrollVertical().expand(),
            Column(
              children: [
                const StepProgressIndicator(
                  totalSteps: 6,
                  currentStep: 1,
                  selectedColor: accentColor,
                ),
                5.heightBox,
                CustomButton(
                  tabController: tabController,
                  text: 'NEXT STEP',
                  // onTap: signUp,
                ),
              ],
            ),
          ],
        ).pSymmetric(h: 30, v: 30),
      ),
    );
  }
}
