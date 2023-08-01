// ignore_for_file: unreachable_switch_case

import 'package:flutter/material.dart';

import '../../model/models.dart';
import '../../screens/chat/chat_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/matches/matches_screen.dart';
import '../../screens/onBoarding/on_boarding_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/user/user_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case UserScreen.routeName:
        return UserScreen.route(user: settings.arguments as User);
      case OnBoardingScreen.routeName:
        return OnBoardingScreen.route();
      case MatchesScreen.routeName:
        return MatchesScreen.route();  
      case ChatScreen.routeName:
        return ChatScreen.route(userMatch: settings.arguments as UserMatchModel);  
      case ProfileScreen.routeName:
        return ProfileScreen.route();  
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
