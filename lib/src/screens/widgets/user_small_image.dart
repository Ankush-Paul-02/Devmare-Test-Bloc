import 'package:flutter/material.dart';

class UserSmallImage extends StatelessWidget {
  const UserSmallImage({
    super.key,
    required this.imageUrls,
  });

  final String imageUrls;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrls),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
