import 'dart:math';

import 'IMode.dart';
import 'package:dart_eval/dart_eval.dart';

class AddMode implements IMode {
  List<String> getExpressions() {
    var rand = Random();
    List<String> expressions = List.generate(5, (index) {
      return "${rand.nextInt(100)} + ${rand.nextInt(100)}";
    });
    print(expressions);
    return expressions;
  }

  double evaluateExppession(String expression) {
    // print(eval(expression));
    return double.parse(eval(expression).toString());
  }
}
