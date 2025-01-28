import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          Text(
            "Made by Sreehari R with flutter 3.6",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: CustomColor.whitePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
