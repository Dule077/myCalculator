import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kalkulator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? firstNumber;
  double? secondNumber;
  String? operator;

  void tapNumber(double tappedNumber) {
    if (firstNumber == null || (firstNumber != null && operator == null)) {
      firstNumber = tappedNumber;
    } else if (firstNumber != null && operator == null) {
      firstNumber = tappedNumber;
    } else if (firstNumber != null && operator != null) {
      secondNumber = firstNumber;
      firstNumber = tappedNumber;
    }
    setState(() {});
  }

  void negativeNumber() {
    firstNumber = firstNumber! * (-1);
    setState(() {
    });
  }

  void allClear(double tapAC) {
    firstNumber = tapAC;
    if (firstNumber == tapAC) {
      firstNumber = null;
    }
    ;
    setState(() {});
  }

  void tapOperator(String tappedOperator) {
    operator = tappedOperator;
    setState(() {});
  }

  void calculate() {
    if (operator != null && firstNumber != null && secondNumber != null) {
      if (operator == 'x') {
        firstNumber = (firstNumber! * secondNumber!);
      } else if (operator == '÷') {
        firstNumber = (secondNumber! / firstNumber!);
      } else if (operator == '+') {
        firstNumber = (firstNumber! + secondNumber!);
      } else if (operator == '%') {
        firstNumber = (secondNumber! / 100 * firstNumber!);
      } else {
        firstNumber = (secondNumber! - firstNumber!);
      }
    }
    setState(() {});
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
                    firstNumber == null ? '' : firstNumber.toString(),
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
                              allClear(0);
                            },
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    'AC',
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
                                )),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {negativeNumber();},
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    '+/-',
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
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
                            onTap: () {},
                            child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    ',',
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
                                    style: TextStyle(color: Colors.black, fontSize: 20),
                                  )),
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
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
