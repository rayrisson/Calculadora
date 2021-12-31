import 'package:function_tree/function_tree.dart';

class Buffer{
  String _value = '0';
  String _result = '';
  bool zeroInLeft = true;
  List<String> symbols = ['+', '-', 'x', '÷'];
  List<String> historyOperators = [];

  void applyChange(String command){
    int lastIndex = _value.length - 1;

    if(command == '='){
      _value = _result;
      _result = '';
      historyOperators.clear();
    }else if(command == '⌫'){
      if(_value.length == 1){
        _value = '0';
      }else{
        if(symbols.contains(_value[lastIndex])){
          historyOperators.removeLast();
        }
        _value = _value.substring(0, lastIndex);
      }
    }else if(command == 'AC'){
      _value = '0';
      _result = '';
      historyOperators.clear();
    }else if(symbols.contains(_value[lastIndex]) && symbols.contains(command)){
      _value = _value.substring(0, lastIndex);
      _value += command;
      historyOperators.last = command;
    }else if(symbols.contains(command)){
      _value += command;
      historyOperators.add(command);
    }else{
      validNumber(command);
    }

    lastIndex = _value.length - 1;

    if(historyOperators.isNotEmpty){
      if(!symbols.contains(_value[lastIndex]) && _value[lastIndex] != ',') {
        adjustResult();
      }
    }
  }

  void validNumber(String command){
      String lastOperator;
      String lastTerm;

      if(historyOperators.isEmpty){
        lastTerm = _value;
      }else{
        lastOperator = historyOperators.last;
        lastTerm = _value.split(lastOperator).last;
      }

      if(command == ','){
        if(lastTerm.split(',').length < 2 && lastTerm.isNotEmpty){
        _value += ',';
        }
      }else if(command == '%'){
        if(lastTerm.isNotEmpty) {
          double aux = double.parse(lastTerm.replaceFirst(',', '.'));
          int sizeLastTerm = lastTerm.length;

          aux /= 100;
          _value = _value.substring(0, _value.length - sizeLastTerm);

          if(aux.compareTo(aux.toInt()) == 0) {
            _value += aux.toInt().toString().replaceFirst('.', ',');
          }else{
            _value += aux.toString().replaceFirst('.', ',');
          }
        }
      }else if(lastTerm.isEmpty){
        _value += command;
      }else if(lastTerm[0] == '0' && lastTerm.length == 1){
        if(command == ','){
          _value += command;
        }else{
          _value = _value.substring(0, _value.length - 1);
          _value += command;
        }
      }else{
        _value += command;
      }
  }

  void adjustResult(){
    String aux = _value;
    aux = aux.replaceAll('x', '*');
    aux = aux.replaceAll('÷', '/');
    aux = aux.replaceAll(',', '.');
    num parcialResult = aux.interpret();

    if(parcialResult.compareTo(parcialResult.toInt()) == 0){
      _result = parcialResult.toInt().toString();
    }else{
      _result = parcialResult.toString().replaceFirst('.', ',');
    }
  }

  String get value {
    return _value;
  }

  String get result{
    return _result;
  }
}