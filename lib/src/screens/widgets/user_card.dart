import 'package:devmate/src/screens/widgets/user_small_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/models.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(user.imageUrls[0]),
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 4,
                blurRadius: 4,
                offset: const Offset(3, 3),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color.fromARGB(200, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              '${user.name} ${user.age}'.text.semiBold.size(24).white.make(),
              user.jobTitle.text.normal.size(22).white.make(),
              Row(
                children: [
                  UserSmallImage(imageUrls: user.imageUrls[1]),
                  UserSmallImage(imageUrls: user.imageUrls[2]),
                  UserSmallImage(imageUrls: user.imageUrls[3]),
                  10.widthBox,
                  Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      color: Colors.grey,
                      size: 25,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    ).box.size(100.w, 70.h).make().pSymmetric(h: 20, v: 10).hero('user_image').scrollVertical();
  }
}
