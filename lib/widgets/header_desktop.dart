import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/nav_items.dart';
import 'package:my_portfolio/styles/style.dart';
import 'package:my_portfolio/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavTapdesktop});
  final Function(int) onNavTapdesktop;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        width: double.maxFinite,
        decoration: kHeaderdecoration,
        child: Row(children: [
          SiteLogo(
            onTap: () {},
          ),
          Spacer(),
          for (int i = 0; i < navItems.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                  onPressed: () {
                    onNavTapdesktop(i);
                  },
                  child: Text(
                    navItems[i],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.whitePrimary),
                  )),
            )
        ]));
  }
}
