// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, this.onPressed});
  final IconData icon;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0.w,
        height: 56.0.h,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0XFF4A4E69),
    );
  }
}
