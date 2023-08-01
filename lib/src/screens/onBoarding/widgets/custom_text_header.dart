import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextHeader extends StatelessWidget {
  final TabController? tabController;
  final String text;
  const TextHeader({
    super.key,
    this.tabController,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return text.text.white.headline3(context).normal.make();
  }
}
