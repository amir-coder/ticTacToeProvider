import 'package:flutter/cupertino.dart';

class TableOfCases with ChangeNotifier {
  List<String> squares = <String>[
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  String xValue = 'assets/X_gradient';
  String oValue = 'assets/O_gradient';
  String currentValue;
  String winner;

  //methodes
  bool xIsNext() {
    return !(currentValue == xValue);
  }

  String myValue(int index) {
    return squares[index - 1];
  }

  void onChangedHandler(int index) {
    if (winner == null) {
      if (xIsNext()) {
        squares[index - 1] = xValue;
        currentValue = xValue;
      } else {
        squares[index - 1] = oValue;
        currentValue = oValue;
      }
    }
    winner = calculateWinner(this.squares);
    notifyListeners();
  }
}

String calculateWinner(List<String> squares) {
  const lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  var i;
  for (i = 0; i < lines.length; i++) {
    if (squares[lines[i][1]] != null &&
        squares[lines[i][1]] == squares[lines[i][2]] &&
        squares[lines[i][1]] == squares[lines[i][3]]) {
      return squares[lines[i][1]];
    }
  }
  return null;
}
