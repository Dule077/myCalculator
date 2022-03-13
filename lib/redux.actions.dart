import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:kalkulator/app_state.dart';
import 'package:kalkulator/selectors.dart';

class TapNumberAction extends ReduxAction<AppState> {
  final int tappedNumber;

  TapNumberAction({required this.tappedNumber});

  @override
  AppState reduce() {
    String? firstNumberString;
    num? firstNumber = getFirstNumber(state);
    num? secondNumber = getSecondNumber(state);
    String? operator = getOperator(state);
    String? zarez = getZarez(state);

    if (firstNumber == null) {
      return state.copyWith(firstNumber: tappedNumber);
    } else if (firstNumber != null && operator == null && zarez == null) {
      firstNumberString = (firstNumber.toString() + tappedNumber.toString());
      return state.copyWith(firstNumber: num.parse(firstNumberString));
    } else if (firstNumber is int && zarez == '.' && operator == null) {
      firstNumberString =
          (firstNumber.toString() + '.' + tappedNumber.toString());
      state.zarez = null;
      return state.copyWith(firstNumber: num.parse(firstNumberString));
    } else if (firstNumber != null &&
        operator != null &&
        secondNumber == null) {
      return state.copyWith(
          firstNumber: tappedNumber, secondNumber: firstNumber);
    } else if (firstNumber != null &&
        operator != null &&
        secondNumber != null &&
        zarez == null) {
      firstNumberString = (firstNumber.toString() + tappedNumber.toString());
      return state.copyWith(firstNumber: num.parse(firstNumberString));
    } else if (firstNumber is int &&
        operator != null &&
        secondNumber != null &&
        zarez == '.') {
      firstNumberString =
          (firstNumber.toString() + '.' + tappedNumber.toString());
      state.zarez = null;
      return state.copyWith(firstNumber: num.parse(firstNumberString));
    }
    return state;
  }
}

class NegativeNumberAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    num? firstNumber = getFirstNumber(state);
    return state.copyWith(firstNumber: firstNumber! * (-1));
  }
}

class AllClearAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    state.operator = null;
    state.firstNumber = null;
    state.secondNumber = null;
    state.zarez = null;
    return state.copyWith();
  }
}

class TapOperatorAction extends ReduxAction<AppState> {
  final String tappedOperator;

  TapOperatorAction({required this.tappedOperator});

  @override
  AppState reduce() {
    return state.copyWith(operator: tappedOperator);
  }
}

class TapZarezAction extends ReduxAction<AppState> {
  final String tappedZarez;

  TapZarezAction({required this.tappedZarez});

  @override
  AppState reduce() {
    return state.copyWith(zarez: tappedZarez);
  }
}

class CalculateAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    num? firstNumber = getFirstNumber(state);
    num? secondNumber = getSecondNumber(state);
    String? operator = getOperator(state);
    if (operator != null && firstNumber != null && secondNumber != null) {
      if (operator == 'x') {
        state.operator = null;
    state.secondNumber =null;
    state.zarez = null;
        return state.copyWith(
            firstNumber: (firstNumber! * secondNumber!));

      } else if (operator == '÷') {
        state.operator = null;
        state.secondNumber =null;
        state.zarez = null;
        return state.copyWith(
            firstNumber: (secondNumber! / firstNumber!));
      } else if (operator == '+') {
        state.operator = null;
        state.secondNumber =null;
        state.zarez = null;
        return state.copyWith(
            firstNumber: (firstNumber! + secondNumber!));
      } else if (operator == '%') {
        state.operator = null;
        state.secondNumber =null;
        state.zarez = null;
        return state.copyWith(
            firstNumber: (secondNumber! / 100 * firstNumber!),
            );
      } else {
        state.operator = null;
        state.secondNumber =null;
        state.zarez = null;
        return state.copyWith(
            firstNumber: (secondNumber! - firstNumber!),
           );
      }
    }
    return state;
  }
}
