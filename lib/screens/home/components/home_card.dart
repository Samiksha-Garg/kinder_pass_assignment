import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/size_config.dart';

import '../../../helper/constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final Color color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: getProportionateScreenWidth(45),
        height: getProportionateScreenHeight(35),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(5),
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600),
        )),
      ),
    );
  }
}
