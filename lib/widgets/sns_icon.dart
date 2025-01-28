import 'package:flutter/material.dart';
import "dart:js" as js;

class SnsIcon extends StatelessWidget {
  const SnsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        InkWell(
          onTap: () {
            js.context.callMethod('open', ['https://github.com/Sree14hari']);
          },
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(20),
              child: Image.asset(
                "assets/images/github.gif",
                width: 28,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
          height: 0,
        ),
        InkWell(
          onTap: () {
            js.context.callMethod(
                'open', ['https://www.linkedin.com/in/sree14hari/']);
          },
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(20),
              child: Image.asset(
                "assets/images/link.gif",
                width: 28,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            js.context
                .callMethod('open', ['https://www.instagram.com/s_ree.har_i']);
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/inst.gif",
                width: 28,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            js.context
                .callMethod('open', ['https://www.facebook.com/sree14hari']);
          },
          child: ClipOval(
            child: SizedBox.fromSize(
              size: Size.fromRadius(20),
              child: Image.asset(
                "assets/images/face.gif",
                width: 28,
              ),
            ),
          ),
        )
      ],
    );
  }
}
