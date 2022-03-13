import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:kalkulator/app_state.dart';

class MyHome extends StatefulWidget {
  MyHome(
      {Key? key,
      required this.title,
      this.operator,
      this.secondNumber,
      this.firstNumber,
      required this.tapOperator,
      required this.tapNumber,
      required this.allClear,
      required this.calculate,
      required this.negativeNumber,
      this.zarez,
      required this.tapZarez})
      : super(key: key);

  final String title;
  final num? firstNumber;
  final num? secondNumber;
  final String? operator;
  final String? zarez;
  final Function(BuildContext, int) tapNumber;
  final Function(BuildContext) negativeNumber;
  final Function(BuildContext) allClear;
  final Function(BuildContext, String) tapOperator;
  final Function(BuildContext) calculate;
  final Function(BuildContext, String) tapZarez;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void tapNumber(int tappedNumber) {
    widget.tapNumber(context, tappedNumber);
  }

  void negativeNumber() {
    widget.negativeNumber(context);
  }

  void allClear() {
    widget.allClear(context);
  }

  void tapOperator(String tappedOperator) {
    widget.tapOperator(context, tappedOperator);
  }

  void calculate() {
    widget.calculate(context);
  }

  void tapZarez(String tappedZarez){
    widget.tapZarez(context, tappedZarez);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 375,
              child: Container(
                color: Colors.black,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    widget.firstNumber == null
                        ? ''
                        : widget.firstNumber.toString(),
                    style: TextStyle(color: Colors.red, fontSize: 32),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 625,
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              allClear();
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    'AC',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              negativeNumber();
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '+/-',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapOperator('%');
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '%',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapOperator('÷');
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '÷',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(7);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '7',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(8);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '8',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(9);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '9',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapOperator('x');
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    'x',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(4);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '4',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(5);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '5',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(6);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '6',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapOperator('-');
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(1);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(2);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(3);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              tapOperator('+');
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                          flex: 50,
                          child: GestureDetector(
                            onTap: () {
                              tapNumber(0);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 25,
                          child: GestureDetector(
                            onTap: () {
                              tapZarez('.');
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    ',',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 25,
                          child: GestureDetector(
                            onTap: () {
                              calculate();
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '=',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 20),
                                  )),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                )),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
