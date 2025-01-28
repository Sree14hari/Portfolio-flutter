import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import "dart:js" as js;

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hi,\nI'm Sreehari R\nA Flutter Developer",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    js.context.callMethod(
                        "open", ["https://www.instagram.com/s_ree.har_i"]);
                  },
                  child: const Text("Get in Touch"),
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/hero.png",
            width: screenWidth / 8,
          ),
        ],
      ),
    );
  }
}
