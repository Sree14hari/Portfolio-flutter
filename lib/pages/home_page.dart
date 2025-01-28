// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/skill_items.dart';
import 'package:my_portfolio/utils/projects_utils.dart';
import 'package:my_portfolio/widgets/contact_text.dart';
import 'package:my_portfolio/widgets/drawer_mobile.dart';
import 'package:my_portfolio/widgets/footer.dart';
import 'package:my_portfolio/widgets/header_desktop.dart';
import 'package:my_portfolio/widgets/header_mobile.dart';
import 'package:my_portfolio/widgets/main_desktop.dart';
import 'package:my_portfolio/widgets/main_mobpage.dart';
import 'package:my_portfolio/widgets/projectCard.dart';
import 'package:my_portfolio/widgets/skills_desk.dart';
import 'package:my_portfolio/widgets/skills_mob.dart';
import 'package:my_portfolio/widgets/sns_icon.dart';

import '../constants/colors.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarkeys =
      List.generate(navItems.length, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
        key: ScaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: Constraints.maxWidth > kWidthDesktop
            ? null
            : DrawerMobile(onNavTap: (int navIndex) {
                ScaffoldKey.currentState?.closeEndDrawer();
                scrollToSection(navIndex);
              }),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(key: navbarkeys.first),
              // MAIN
              if (Constraints.maxWidth > kWidthDesktop)
                HeaderDesktop(
                  onNavTapdesktop: (int navIndex) {
                    //call scroll function
                    scrollToSection(navIndex);
                  },
                )
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

              // *******************SKILLS******************

              //########### DESKTOP SKILLS ###########

              if (Constraints.maxWidth > kWidthTablet)
                Container(
                  key: navbarkeys[1],
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
                      SkillsDesk()
                    ],
                  ),
                )

              //########### MOBILE SKILLS ###########

              else
                Container(
                  height: screenHeight,
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
                      SkillsMob()
                    ],
                  ),
                ),

              // SizedBox(
              //   height: 500,
              //   width: double.maxFinite,
              // ),

              //*******************PROJESTCS******************

              Container(
                key: navbarkeys[2],
                width: screenWidth,
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.scaffoldBg,
                child: Column(
                  children: [
                    //work project title
                    Text(
                      "Github Repositories",
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

                    //work project cards
                    Wrap(
                      spacing: 25,
                      runSpacing: 25,
                      children: [
                        for (int i = 0; i < projectItems.length; i++)
                          ProjectCardWidget(
                            project: projectItems.elementAt(i),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: double.maxFinite,
                    ),
                    if (Constraints.maxWidth > kWidthDesktop)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/hero4.png",
                            width: 100 * 2,
                            height: 150 * 2,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "More Projects Coming Soon....",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.whitePrimary,
                            ),
                          ),
                        ],
                      )
                    else ...[
                      Image.asset(
                        "assets/images/hero4.png",
                        width: 100,
                        height: 150,
                      ),
                      SizedBox(
                        height: 20,
                        width: double.maxFinite,
                      ),
                      Text(
                        "More Projects Coming Soon....",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              //********************CONTACT**********************
              Container(
                  key: navbarkeys[3],
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.bgLight1,
                  child: Column(
                    children: [
                      Text(
                        "Get in Touch",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: Row(
                          children: [
                            Flexible(
                              child: ContactText(
                                hintText: "Your name...",
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: ContactText(
                                hintText: "Email...",
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: ContactText(
                          hintText: "Message...",
                          maxLines: 10,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 700),
                        child: SizedBox(
                          width: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColor.yellowPrimary,
                            ),
                            child: Text(
                              "Get in touch",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: Divider()),
                      SizedBox(
                        height: 30,
                      ),
                      //SNS ICONS
                      SnsIcon(),
                    ],
                  )),
              //*******************FOOTER************************
              Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      js.context.callMethod(
          "open", ["https://www.reddit.com/u/S_reehar_i/s/sO3J3d8tAn"]);
    }
    final key = navbarkeys[navIndex];
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
