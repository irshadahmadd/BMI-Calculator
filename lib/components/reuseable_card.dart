// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last, prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class reUseAbleCard extends StatelessWidget {
  final Color colour;
  final cardChild;
  final onPress;
  reUseAbleCard({required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        // height: height / 10,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
