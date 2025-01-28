import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      // child: Text(
      //   "SHR",
      //   style: TextStyle(
      //       fontSize: 32.0,
      //       fontWeight: FontWeight.w900,
      //       decoration: TextDecoration.underline,
      //       color: CustomColor.yellowSecondary),
      // ),

      child: Image.asset(
        "assets/images/logo3.png",
        height: 50,
        width: 70,
        alignment: Alignment.centerRight,
      ),
    );
  }
}
