import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillsDesk extends StatelessWidget {
  const SkillsDesk({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: 20),
        //platforms
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(9)),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: Image.asset(
                      platformItems[i]['img'],
                      width: 70,
                    ),
                    title: Text(platformItems[i]['name']),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(width: 20),
        Image.asset(
          "assets/images/hero3.png",
          width: screenWidth / 8,
        ),
        SizedBox(width: 20),

        // skills
        Flexible(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: 400, maxHeight: screenHeight / 100),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Container(
                    width: 190,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(9)),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      leading: Image.asset(
                        skillItems[i]['img'],
                        width: 70,
                        alignment: Alignment.centerLeft,
                      ),
                      title: Text(
                        skillItems[i]['name'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                // Chip(
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 19),
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //       side: BorderSide(color: CustomColor.bgLight2)),
                //   label: Text(skillItems[i]['name']),
                //   avatar: Image.asset(skillItems[i]['img'],
                //       width: 200, height: 200),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
