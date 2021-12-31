import 'package:calculadora/components/button.dart';
import 'package:calculadora/components/buttonRow.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) callback;

  Keyboard({required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: const Color.fromRGBO(54, 54, 54, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 5),
          ButtonRow(buttons: [
            Button(value: 'AC', textColor: Button.ORANGE, primaryColor: Button.ORANGE, callback: callback),
            Button(value: '⌫', textColor: Button.ORANGE, primaryColor: Button.ORANGE, callback: callback),
            Button(value: '%', textColor: Button.ORANGE, primaryColor: Button.ORANGE, callback: callback),
            Button(value: '÷', textColor: Button.ORANGE, primaryColor: Button.ORANGE, callback: callback)
          ]),
          const SizedBox(height: 5),
          ButtonRow(buttons: [
            Button(value: '7', callback: callback),
            Button(value: '8', callback: callback),
            Button(value: '9', callback: callback),
            Button(value: 'x', textColor: Button.ORANGE, primaryColor: Button.ORANGE, callback: callback)
          ]),
          const SizedBox(height: 5),
          ButtonRow(buttons: [
            Button(value: '4', callback: callback),
            Button(value: '5', callback: callback),
            Button(value: '6', callback: callback),
            Button(value: '-', textColor: Button.ORANGE, primaryColor: Button.ORANGE, callback: callback)
          ]),
          const SizedBox(height: 5),
          ButtonRow(buttons: [
            Button(value: '1', callback: callback),
            Button(value: '2', callback: callback),
            Button(value: '3', callback: callback),
            Button(value: '+', textColor: Button.ORANGE, primaryColor: Button.ORANGE, callback: callback)
          ]),
          const SizedBox(height: 5),
          ButtonRow(buttons: [
            Button.big(value: '0', callback: callback),
            Button(value: ',', callback: callback),
            Button(value: '=',  primaryColor: Button.ORANGE, secondColor: Button.ORANGE, callback: callback),
          ]),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
