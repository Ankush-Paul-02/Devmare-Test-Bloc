import 'package:devmate/src/model/models.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../widgets/choice_button.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key, required this.user});

  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => UserScreen(user: user),
    );
  }

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ).onTap(
          () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 45,
                    top: 30,
                    left: 10,
                    right: 10,
                  ),
                  child: Hero(
                    tag: 'user_image',
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.imageUrls[0]),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          color: Colors.redAccent,
                          icon: Icons.clear_outlined,
                          hasGradient: false,
                        ),
                        ChoiceButton(
                          width: 75,
                          height: 75,
                          size: 30,
                          color: Colors.white,
                          hasGradient: true,
                          icon: Icons.favorite,
                        ),
                        ChoiceButton(
                          color: Colors.brown,
                          icon: Icons.watch_later_outlined,
                          hasGradient: false,
                          size: 25,
                          height: 60,
                          width: 60,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //! Interests
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '${user.name} ${user.age}'.text.white.size(26).bold.make(),
              user.jobTitle.text.white.size(18).normal.make(),
              15.heightBox,
              'About'.text.white.size(22).semiBold.make(),
              user.bio.text.white
                  .size(22)
                  .textStyle(Theme.of(context).textTheme.displaySmall)
                  .size(16)
                  .lineHeight(2)
                  .make(),
              15.heightBox,
              'Interests'.text.white.size(22).semiBold.make(),
              Row(
                children: user.interests
                    .map(
                      (interest) => Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.only(top: 5, right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [
                              primaryColor,
                              accentColor,
                            ],
                          ),
                        ),
                        child: interest.text
                            .headline6(context)
                            .size(16)
                            .white
                            .make(),
                      ),
                    )
                    .toList(),
              )
            ],
          ).pSymmetric(h: 20, v: 8),
        ],
      ).scrollVertical(),
    );
  }
}
