// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  String? text;

  ResponsiveButton({Key? key, this.text, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor),
        child: Container(
            child: isResponsive == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Text(
                          text!,
                          style: const TextStyle(
                              fontSize: 17, color: Colors.white),
                        ),
                        Image.asset('img/button-one.png')
                      ])
                : Image.asset('img/button-one.png')),
      ),
    );
  }
}
