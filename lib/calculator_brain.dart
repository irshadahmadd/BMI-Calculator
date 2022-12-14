import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  int height;
  int weight;
  late double _bmi;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'you have a higher than normal body weight . Do more exercise! ';
    } else if (_bmi > 18.5) {
      return 'you have a normal body weight.Good job!';
    } else {
      return 'you have a lower than normal body weight. You can eat a bit more!';
    }
  }
}
