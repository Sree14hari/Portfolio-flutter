// ignore_for_file: unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/skill_items.dart';
import 'package:my_portfolio/utils/projects_utils.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobpage.dart';
import 'package:my_portfolio/widgets/projectCard.dart';
import 'package:my_portfolio/widgets/skills_desk.dart';
import 'package:my_portfolio/widgets/skills_mob.dart';

import '../constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: ScaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: Constraints.maxWidth > kWidthDesktop ? null : DrawerMobile(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            // MAIN
            if (Constraints.maxWidth > kWidthDesktop)
              const HeaderDesktop()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  ScaffoldKey.currentState?.openEndDrawer();
                },
              ),
            // projects
            /*SizedBox(
              height: 50,
              width: double.maxFinite,
            ),*/
            if (Constraints.maxWidth > kWidthDesktop)
              const MainDesktop()
            else ...[
              SizedBox(
                height: 50,
                width: double.maxFinite,
              ),
              MainMobpage()
            ],
            // skills main
            Container(
              height: 550,
              width: screenWidth,
              padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: CustomColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //title
                  Text(
                    "What I can do .... ?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                  ),

                  //platforms and skills
                  if (Constraints.maxWidth > kWidthTablet)
                    SkillsDesk()
                  else
                    SkillsMob(),
                ],
              ),
            ),
            // SizedBox(
            //   height: 500,
            //   width: double.maxFinite,
            // ),

            //*******************PROJESTCS******************
            Container(
              width: screenWidth,
              height: screenHeight,
              padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: Colors.blueGrey,
              child: Column(
                children: [
                  //work project title
                  Text(
                    "GITHUB REPOSITORIRES",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),

                  //work project cards
                  ProjectCardWidget(
                    project: projectItems.first,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
