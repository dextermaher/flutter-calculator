import 'package:flutter/material.dart';
import 'calculator_display.dart';

void main() => runApp(CalculatorLauncher());

class CalculatorLauncher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        // canvasColor: Color(0xFF1A1A1B),
        canvasColor: Colors.grey[900],
      ),
      home: MyHomePage(),
      //home: HomeScreen(),
    );
  }
}
