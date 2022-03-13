import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:kalkulator/app_state.dart';
import 'package:kalkulator/home.dart';
import 'package:kalkulator/redux.actions.dart';
import 'package:kalkulator/selectors.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      vm: () => Factory(this),
      builder: (BuildContext context, ViewModel vm) => MyHome(
        title: 'Kalkulator',
        firstNumber: vm.firstNumber,
        secondNumber: vm.secondNumber,
        operator: vm.operator,
        zarez: vm.zarez,
        tapNumber: this.tapNumber,
        negativeNumber: this.negativeNumber,
        allClear: this.allClear,
        tapOperator: this.tapOperator,
        calculate: this.calculate,
        tapZarez: this.tapZarez,
      ),
    );
  }

  void tapZarez(BuildContext context,String tappedZarez){
    StoreProvider.dispatch(context, TapZarezAction(tappedZarez: tappedZarez));

  }

  void tapNumber(BuildContext context, int tappedNumber) {
    StoreProvider.dispatch(context, TapNumberAction(tappedNumber: tappedNumber));
  }

  void negativeNumber(BuildContext context) {
    StoreProvider.dispatch(context, NegativeNumberAction());
  }

  void allClear(BuildContext context) {
    StoreProvider.dispatch(context, AllClearAction());
  }

  void tapOperator(BuildContext context, String tappedOperator) {
    StoreProvider.dispatch(context, TapOperatorAction(tappedOperator: tappedOperator));
  }

  void calculate(BuildContext context) {
    StoreProvider.dispatch(context, CalculateAction());
  }
}

class Factory extends VmFactory<AppState, MyHomePage> {
  Factory(widget) : super(widget);

  @override
  ViewModel fromStore() => ViewModel(
      firstNumber: getFirstNumber(state),
      secondNumber: getSecondNumber(state),
      operator: getOperator(state),
  zarez: getZarez(state));
}

class ViewModel extends Vm {
  num? firstNumber;
  num? secondNumber;
  String? operator;
  String? zarez;

  ViewModel({this.firstNumber, this.secondNumber, this.operator, this.zarez});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is ViewModel &&
          runtimeType == other.runtimeType &&
          firstNumber == other.firstNumber &&
          secondNumber == other.secondNumber &&
          operator == other.operator &&
  zarez == other.zarez;

  @override
  int get hashCode =>
      super.hashCode ^
      firstNumber.hashCode ^
      secondNumber.hashCode ^
      operator.hashCode ^
  zarez.hashCode;
}
