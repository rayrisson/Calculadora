import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String problem;
  final String result;

  Display({this.problem = '0', this.result = '0'});

  String setResult(){
    if(result == ''){
      return '';
    }else{
      return '=' + result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: const Color.fromRGBO(79, 79, 79, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              AutoSizeText(
                problem,
                maxLines: 2,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.w100
                ),
              ),
              const SizedBox(height: 40),
              AutoSizeText(
                setResult(),
                maxLines: 1,
                maxFontSize: 40,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 40,
                    fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
        )
    );
  }
}
