import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
class Buildivider extends StatelessWidget {
  Buildivider({super.key,required this.endIndent});
  double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColor.yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }
}
