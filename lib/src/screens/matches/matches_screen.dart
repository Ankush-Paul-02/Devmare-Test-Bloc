import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../../model/models.dart';
import '../widgets/user_small_image.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  static const String routeName = '/matches';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const MatchesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = UserMatchModel.matches
        .where((element) => element.userId == 1 && element.chats.isEmpty)
        .toList();
    final activeMatches = UserMatchModel.matches
        .where((element) => element.userId == 1 && element.chats.isNotEmpty)
        .toList();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: const Icon(Icons.arrow_back, color: Colors.grey),
        title: 'Matches'.text.white.size(28).semiBold.make().centered(),
        actions: [
          const Icon(Icons.message, color: Colors.grey),
          5.w.widthBox,
          const Icon(Icons.person, color: Colors.grey),
          5.w.widthBox,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Your Likes'.text.bold.size(24).white.make(),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: inactiveMatches.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UserSmallImage(
                      imageUrls:
                          inactiveMatches[index].matchedUser.imageUrls[0],
                    ),
                    inactiveMatches[index]
                        .matchedUser
                        .name
                        .text
                        .size(16)
                        .semiBold
                        .white
                        .make()
                  ],
                );
              },
            ),
          ),
          10.heightBox,
          'Your Chats'.text.bold.size(24).white.make(),
          ListView.builder(
            itemCount: activeMatches.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              children: [
                UserSmallImage(
                  imageUrls: activeMatches[index].matchedUser.imageUrls[0],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! User name
                    activeMatches[index]
                        .matchedUser
                        .name
                        .text
                        .size(16)
                        .white
                        .overflow(TextOverflow.ellipsis)
                        .semiBold
                        .make(),
                    5.heightBox,
                    //! Message
                    activeMatches[index]
                        .chats[0]
                        .messages[0]
                        .message
                        .text
                        .overflow(TextOverflow.ellipsis)
                        .size(14)
                        .white
                        .normal
                        .make(),
                    //! Date
                    activeMatches[index]
                        .chats[0]
                        .messages[0]
                        .timeString
                        .text
                        .overflow(TextOverflow.ellipsis)
                        .size(14)
                        .color(grey)
                        .bodyText1(context)
                        .make(),
                  ],
                ),
              ],
            ).onInkTap(
              () => Navigator.pushNamed(
                context,
                '/chat',
                arguments: activeMatches[index],
              ),
            ),
          ),
        ],
      ).p20().scrollVertical(),
    );
  }
}
