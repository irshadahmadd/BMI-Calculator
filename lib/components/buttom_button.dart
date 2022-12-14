// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({required this.buttonTitle, required this.onTap});

  Function()? onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
          style: kLargeButtonTextStyle,
        ),
        color: kButtomContainer,
        margin: EdgeInsets.only(top: 10),
        height: kButtomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
