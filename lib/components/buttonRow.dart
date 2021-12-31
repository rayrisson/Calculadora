import 'package:calculadora/components/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  List<Button> buttons;
  
  ButtonRow({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[SizedBox(width: 5)], (list, button) {
          list.addAll([button, SizedBox(width: 5)]);
          return list;
        }),
      ),
    );
  }
}
