// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_constructors_in_immutables, camel_case_types, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, sort_child_properties_last, empty_constructor_bodies
import 'package:bmi_calculator/screens/ResultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/buttom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int Height = 180;
  int Weight = 45;
  int Age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          textAlign: TextAlign.center,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              'by Abbas',
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: reUseAbleCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          colour: selectedGender == Gender.male
                              ? kInActiveColor
                              : kActiveColor,
                          cardChild: iconContent(
                            icon: FontAwesomeIcons.mars,
                            label: 'MALE',
                          ),
                        ),
                      ),
                      Expanded(
                        child: reUseAbleCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kInActiveColor
                              : kActiveColor,
                          cardChild: iconContent(
                            icon: FontAwesomeIcons.venus,
                            label: 'FEMALE',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: reUseAbleCard(
                          // onPress: () {},
                          colour: kActiveColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'HEIGHT',
                                style: kLabelTextStyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Text(
                                    Height.toString(),
                                    style: kFont,
                                  ),
                                  Text(
                                    'cm',
                                    style: kLabelTextStyle,
                                  )
                                ],
                              ),
                              Slider(
                                value: Height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                //activeColor: Colors.red,
                                onChanged: ((double newValue) {
                                  setState(() {
                                    Height = newValue.round();
                                  });
                                }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: reUseAbleCard(
                    colour: kActiveColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(Weight.toString(), style: kFont),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    Weight--;
                                  });
                                },
                              )),
                              Expanded(
                                  child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    Weight++;
                                  });
                                },
                              )),
                            ],
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: reUseAbleCard(
                    onPress: () {},
                    colour: kActiveColor,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(Age.toString(), style: kFont),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    Age--;
                                  });
                                },
                              )),
                              Expanded(
                                  child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    Age++;
                                  });
                                },
                              )),
                            ],
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ButtomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: Height, weight: Weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultsPage(
                        bmiResult: calc.calculateBmi(),
                        resultText: calc.getResult(),
                        interpretaion: calc.getInterpretation(),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
