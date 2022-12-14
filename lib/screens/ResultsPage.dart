// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_key_in_widget_constructors, must_be_immutable
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult,
      required this.interpretaion,
      required this.resultText});

  String bmiResult;
  String resultText;
  String interpretaion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),

      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reUseAbleCard(
              colour: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiResult,
                    style: kBMItextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    interpretaion,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          ButtomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
