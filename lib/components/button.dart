import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const ORANGE = Color.fromRGBO(255, 140, 0, 1);
  static const TRANSPARENT = Color.fromRGBO(0, 0, 0, 0);
  static const WHITE = Colors.white;
  final String value;
  final Color primaryColor;
  final Color secondColor;
  final Color textColor;
  int flexValue = 1;

  Button({Key? key, required this.value, this.primaryColor = WHITE, this.secondColor = TRANSPARENT, this.textColor = WHITE, required this.callback}) : super(key: key);
  Button.big({Key? key, required this.value, this.primaryColor = WHITE, this.secondColor = TRANSPARENT, this.textColor = WHITE, required this.callback}) : super(key: key){
    flexValue = 2;
  }

  final void Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexValue,
      child: OutlinedButton(
          onPressed: () => callback(value),
          style: OutlinedButton.styleFrom(
            backgroundColor: secondColor,
            side: BorderSide(color: primaryColor, width: 2),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w300,
              color: textColor
            ),
          ),
      ),
    );
  }
}
