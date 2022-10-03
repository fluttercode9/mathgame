import 'package:dart_eval/dart_eval.dart';
import 'package:flutter/cupertino.dart';

import 'IMode.dart';

class Game with ChangeNotifier {
  late List<String> exps;
  final IMode mode;
  int currentIndex = 0;
  String userAnswer = '';
  List<String> keys = [
    '1',
    '2',
    '3',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '7',
    '8',
    '9',
    '=',
    '0'
  ];

  addToAnswer(String number) {
    userAnswer += number;
    notifyListeners();
  }

  void evaluateAnswer() {
    var evaluated = mode.evaluateExppession(currentExpression);
    print(evaluated);

    if (evaluated == double.parse(userAnswer)) {
      print("Dobrze!");
      currentIndex++;
      userAnswer = '';
      notifyListeners();
    }
    ;

  }

  Game(this.mode) {
    exps = mode.getExpressions();
  }

  String get currentExpression => exps[currentIndex];
}
