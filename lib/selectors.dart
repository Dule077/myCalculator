import 'package:kalkulator/app_state.dart';

num? getFirstNumber(AppState state) {
  return state.firstNumber;
}

num? getSecondNumber(AppState state) {
  return state.secondNumber;
}

String? getOperator(AppState state) {
  return state.operator;
}

String? getZarez(AppState state) {
  return state.zarez;
}
