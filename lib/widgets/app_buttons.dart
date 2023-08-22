// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  String? text;
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  IconData? icon;
  bool? isIcon;

  AppButtons(
      {super.key,
      this.isIcon = false,
      this.text,
      this.icon,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: size,
      height: size,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor),
      child: isIcon == false
          ? Text(
              text!,
              style: TextStyle(fontWeight: FontWeight.bold, color: color),
            )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
