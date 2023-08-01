import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../constants/colors.dart';
import '../../../cubits/signup_cubit.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  final Function()? onTap;
  const CustomButton({
    super.key,
    required this.tabController,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            primaryColor,
            accentColor,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: () {
          if (tabController.index == 1) {
            context.read<SignupCubit>().signUpWithCredentials();
          }
          tabController.animateTo(tabController.index + 1);

        },
        child:
            text.text.white.semiBold.make().centered().box.width(100.w).make(),
      ),
    );
  }
}
