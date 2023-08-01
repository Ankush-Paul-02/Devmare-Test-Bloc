import 'package:devmate/src/model/models.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../onBoarding/widgets/custom_text_container.dart';
import '../widgets/title_icon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User user = User.users[0];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        leading: const Icon(Icons.arrow_back, color: Colors.grey),
        title: 'Profile'.text.white.size(28).normal.make().centered(),
        actions: [
          const Icon(Icons.message, color: Colors.grey),
          5.w.widthBox,
          const Icon(Icons.person, color: Colors.grey),
          5.w.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.heightBox,
            Stack(
              children: [
                Container(
                  height: 25.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: grey,
                        offset: Offset(3, 3),
                        blurRadius: 3,
                        spreadRadius: 3,
                      )
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                        user.imageUrls[0],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 25.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        primaryColor.withOpacity(0.1),
                        primaryColor.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: user.name.text.bold
                        .headline3(context)
                        .white
                        .make()
                        .pOnly(bottom: 20),
                  ),
                )
              ],
            ),
            10.heightBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithIcon(
                  icon: Icons.edit,
                  title: 'Biography',
                ),
                user.bio.text.bodyText2(context).lineHeight(1.5).white.make(),
                20.heightBox,
                const TitleWithIcon(
                  icon: Icons.image,
                  title: 'Pictures',
                ),
                SizedBox(
                  height: 125,
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 125,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: bgColor1),
                          image: DecorationImage(
                            image: NetworkImage(
                              user.imageUrls[0],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).pOnly(right: 5);
                    },
                  ),
                ),
                20.heightBox,
                const TitleWithIcon(
                  icon: Icons.location_city,
                  title: 'Location',
                ),
                'Kolkata, India'
                    .text
                    .bodyText2(context)
                    .lineHeight(1.5)
                    .white
                    .make(),
                20.heightBox,
                const TitleWithIcon(
                  icon: Icons.interests,
                  title: 'Interests',
                ),
                const Row(
                  children: [
                    CustomTextContainer(text: 'Java'),
                    CustomTextContainer(text: 'Flutter'),
                    CustomTextContainer(text: 'Android'),
                  ],
                )
              ],
            ).p20()
          ],
        ),
      ),
    );
  }
}
