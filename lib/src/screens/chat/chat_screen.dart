// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../../model/models.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';

  static Route route({required UserMatchModel userMatch}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ChatScreen(userMatch: userMatch),
    );
  }

  final UserMatchModel userMatch;

  const ChatScreen({super.key, required this.userMatch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 1,
        centerTitle: true,
        iconTheme: const IconThemeData(color: white),
        title: Column(
          children: [
            5.heightBox,
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(userMatch.matchedUser.imageUrls[0]),
            ),
            userMatch.matchedUser.name.text.white.semiBold.make()
          ],
        ),
      ),
      backgroundColor: bgColor,
      body: Column(
        children: [
          SingleChildScrollView(
            child: userMatch.chats != null
                ? ListView.builder(
                    itemCount: userMatch.chats[0].messages.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ListTile(
                      title: userMatch.chats[0].messages[index].senderId == 1
                          ? Align(
                              alignment: Alignment.topRight,
                              child: userMatch
                                  .chats[0].messages[index].message.text
                                  .color(bgColor)
                                  .normal
                                  .make()
                                  .box
                                  .border(color: bgColor)
                                  .p8
                                  .withRounded(value: 8)
                                  .color(bgColor1)
                                  .make(),
                            )
                          : Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage(
                                        userMatch.matchedUser.imageUrls[0]),
                                  ),
                                  10.widthBox,
                                  userMatch
                                      .chats[0].messages[index].message.text
                                      .color(bgColor1)
                                      .normal
                                      .make()
                                      .box
                                      .border(color: bgColor1)
                                      .p8
                                      .withRounded(value: 8)
                                      .color(bgColor)
                                      .make(),
                                ],
                              ),
                            ),
                    ),
                  )
                : const SizedBox(),
          ).pSymmetric(h: 10, v: 20).expand(),
          Container(
            height: 100,
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const TextField(
                  cursorColor: black,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: bgColor1),
                    ),
                    filled: true,
                    fillColor: white,
                    hintText: 'Type here...',
                    hintStyle: TextStyle(
                      color: grey,
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 20,
                      top: 5,
                      bottom: 5,
                    ),
                  ),
                ).expand(),
                10.widthBox,
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgColor,
                    border: Border.all(color: bgColor1),
                  ),
                  child: Icon(Icons.send_outlined, color: lightGrey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
