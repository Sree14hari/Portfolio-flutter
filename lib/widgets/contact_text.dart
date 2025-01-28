import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';

class ContactText extends StatelessWidget {
  const ContactText(
      {super.key, this.hintText, this.maxLines = 1, this.controller});
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(
        color: CustomColor.scaffoldBg,
      ),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whiteSecondary,
          focusedBorder: getInputBorder,
          enabledBorder: getInputBorder,
          border: getInputBorder,
          hintText: hintText,
          hintStyle: TextStyle(
            color: CustomColor.scaffoldBg,
          )),
    );
  }

  OutlineInputBorder get getInputBorder => OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(10),
      );
}
