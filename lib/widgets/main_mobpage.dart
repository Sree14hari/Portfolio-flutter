// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/size.dart';
import "dart:js" as js;

class MainMobpage extends StatelessWidget {
  const MainMobpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      height: 500,
      constraints: BoxConstraints(minHeight: 500.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // avtr image
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [
                  const Color.fromARGB(255, 67, 48, 48),
                  const Color.fromARGB(0, 184, 145, 145)
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ).createShader(bounds);
            },
            child: Image.asset(
              "assets/images/hero.png",
              height: screenHeight / 4,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //intro text
          Text(
            "Hi,\nI'm Sreehari R.\nA Flutter Developer",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 190,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              ),
              onPressed: () {
                js.context.callMethod(
                    'open', ["https://www.instagram.com/s_ree.har_i/"]);
              },
              child: const Text(
                "Get in Touch",
              ),
            ),
          ),
          //button
        ],
      ),
    );
  }
}
