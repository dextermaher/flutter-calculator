import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Color nonNumberColor = Colors.orange[600];
const Color numberColor = Colors.grey;
List numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, '.'];
List operators = ['/', '*', '-', '+'];

double outcome;
String firstNumber = '0';
String operator;
String secondNumber = '0';
bool creatingFirstNum = true;

Widget myButton(String text, Function function, [Color color = numberColor]) {
  return FlatButton(
    child: Text(
      '$text',
      style: TextStyle(
        color: color,
        fontSize: 30.0,
      ),
    ),
    onPressed: () {
      function();
    },
  );
}

void answerConcat(var value) {
  if ((numbers.contains(value)) && (creatingFirstNum)) {
    firstNumber = '$firstNumber$value';
  } else if ((numbers.contains(value)) && (!creatingFirstNum)) {
    secondNumber = '$secondNumber$value';
  }
  print(firstNumber);
  print(secondNumber);
}

void calculate() {
  if (operator == '/') {
    outcome = double.tryParse(firstNumber) / double.tryParse(secondNumber);
  } else if (operator == '*') {
    outcome = double.tryParse(firstNumber) * double.tryParse(secondNumber);
  } else if (operator == '-') {
    outcome = double.tryParse(firstNumber) - double.tryParse(secondNumber);
  } else if (operator == '+') {
    outcome = double.tryParse(firstNumber) + double.tryParse(secondNumber);
  }
  print(outcome);
}

void reset() {
  outcome = null;
  firstNumber = '0';
  operator = null;
  secondNumber = '0';
  creatingFirstNum = true;
}

String displayCorrectly() {
  String returnList = '‎';
  if (firstNumber != '0') {
    returnList = '$returnList$firstNumber';
  }
  if (operator != null) {
    returnList = '$returnList$operator';
  }
  if (secondNumber != '0') {
    returnList = '$returnList$secondNumber';
  }
  if (outcome != null) {
    returnList = '$returnList = $outcome';
  }
  return returnList;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 60),
              child: Text(
                '${displayCorrectly()}',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.grey[350],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton('C', () {
                  setState(() {
                    reset();
                  });
                }, nonNumberColor),
                myButton('←', () {}, nonNumberColor),
                myButton('.', () {
                  setState(() {
                    answerConcat('.');
                  });
                }, nonNumberColor),
                myButton('÷', () {
                  setState(() {
                    creatingFirstNum = false;

                    operator = '/';
                  });
                }, nonNumberColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton('7', () {
                  setState(() {
                    answerConcat(7);
                  });
                }),
                myButton('8', () {
                  setState(() {
                    answerConcat(8);
                  });
                }),
                myButton('9', () {
                  setState(() {
                    answerConcat(9);
                  });
                }),
                myButton('×', () {
                  setState(() {
                    creatingFirstNum = false;

                    operator = '*';
                  });
                }, nonNumberColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton('4', () {
                  setState(() {
                    answerConcat(4);
                  });
                }),
                myButton('5', () {
                  setState(() {
                    answerConcat(5);
                  });
                }),
                myButton('6', () {
                  setState(() {
                    answerConcat(6);
                  });
                }),
                myButton('-', () {
                  setState(() {
                    creatingFirstNum = false;

                    operator = '-';
                  });
                }, nonNumberColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                myButton('1', () {
                  setState(() {
                    answerConcat(1);
                  });
                }),
                myButton('2', () {
                  setState(() {
                    answerConcat(2);
                  });
                }),
                myButton('3', () {
                  setState(() {
                    answerConcat(3);
                  });
                }),
                myButton('+', () {
                  setState(() {
                    creatingFirstNum = false;

                    operator = '+';
                  });
                }, nonNumberColor),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myButton('0', () {
                  setState(() {
                    answerConcat(0);
                  });
                }),
                myButton('=', () {
                  setState(() {
                    calculate();
                  });
                }, nonNumberColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
