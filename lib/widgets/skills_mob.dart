import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/skill_items.dart';

class SkillsMob extends StatelessWidget {
  const SkillsMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
        children: [
          //platforms
          for (int i = 0; i < platformItems.length; i++)
            Container(
              margin: EdgeInsets.only(bottom: 5.0),
              // width: double.maxFinite,
              decoration: BoxDecoration(
                color: CustomColor.bgLight2,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                leading: Image.asset(
                  platformItems[i]['img'],
                  width: 20,
                ),
                title: Text(
                  platformItems[i]['name'],
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 20,
            width: double.maxFinite,
          ),
          Image.asset(
            "assets/images/hero3.png",
            width: 100,
            height: 150,
          ),
          SizedBox(
            height: 20,
            width: double.maxFinite,
          ),
          //skills
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillItems.length; i++)
                Chip(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: CustomColor.bgLight2)),
                  label: Text(skillItems[i]['name']),
                  avatar: Image.asset(
                    skillItems[i]['img'],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
