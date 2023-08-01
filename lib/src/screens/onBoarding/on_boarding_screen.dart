import 'package:devmate/src/bloc/blocks.dart';
import 'package:devmate/src/cubits/signup_cubit.dart';
import 'package:devmate/src/screens/onBoarding/screens/bio_screen.dart';
import 'package:devmate/src/screens/onBoarding/screens/demo_screen.dart';
import 'package:devmate/src/screens/onBoarding/screens/email_screen.dart';
import 'package:devmate/src/screens/onBoarding/screens/picture_screen.dart';
import 'package:devmate/src/screens/onBoarding/screens/start_screen.dart';
import 'package:devmate/src/services/firebase_auth_methods.dart';
import 'package:devmate/src/services/repository/database_repository.dart';
import 'package:devmate/src/services/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const String routeName = '/onBoarding';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SignupCubit(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          BlocProvider<OnboardingBloc>(
            create: (_) => OnboardingBloc(
              databaseRepository: DatabaseRepository(),
              storageRepository: StorageRepository(),
            )..add(
                StartOnboarding(),
              ),
          ),
        ],
        child: const OnBoardingScreen(),
      ),
    );
  }

  //! Tab names
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Start'),
    Tab(text: 'Email'),
    // Tab(text: 'Email Verification'),
    Tab(text: 'Demographics'),
    Tab(text: 'Pictures'),
    Tab(text: 'Biography'),
    // Tab(text: 'Location')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {}
          });
          return Scaffold(
            appBar: AppBar(
              backgroundColor: bgColor,
              automaticallyImplyLeading: false,
              title: 'Devmare'.text.white.size(28).semiBold.make().centered(),
            ),
            backgroundColor: bgColor,
            body: TabBarView(
              children: [
                StartScreen(tabController: tabController),
                EmailScreen(tabController: tabController),
                // EmailVerifyScreen(tabController: tabController),
                DemoScreen(tabController: tabController),
                PictureScreen(tabController: tabController),
                BioScreen(tabController: tabController),
              ],
            ),
          );
        },
      ),
    );
  }
}
