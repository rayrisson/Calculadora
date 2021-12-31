import 'package:calculadora/components/display.dart';
import 'package:calculadora/components/keyboard.dart';
import 'package:calculadora/models/buffer.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final Buffer buffer = Buffer();

  onPressed(String command){
    setState(() {
      buffer.applyChange(command);
    });
    print(buffer.value);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Display(problem: buffer.value, result: buffer.result),
              Keyboard(callback: onPressed)
            ]
          ),
        )
      )
    );
  }
}
