import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tec_tac_toe/table.dart';

void main() => runApp(MaterialApp(
      home: TecTacToe(),
    ));

//variables

  String xValue = 'assets/X_gradient';
  String oValue = 'assets/O_gradient';


class TecTacToe extends StatefulWidget {
  @override
  _TecTacToeState createState() => _TecTacToeState();
}

class _TecTacToeState extends State<TecTacToe> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableOfCases>(
      create: (context) => TableOfCases(),
      child: Scaffold(
          body: Center(
        child: Game(),
      )),
    );
  }
}

//Game widget

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Boarde(),
    );
  }
}

class Boarde extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Table(
      border: TableBorder(
        verticalInside: BorderSide(color: Colors.black),
        horizontalInside: BorderSide(color: Colors.black),
      ),
      children: [
        TableRow(children: [
          Square(
            index: 1,
          ),
          Square(
            index: 2,
          ),
          Square(
            index: 3,
          ),
        ]),
        TableRow(children: [
          Square(
            index: 4,
          ),
          Square(
            index: 5,
          ),
          Square(
            index: 6,
          ),
        ]),
        TableRow(children: [
          Square(
            index: 7,
          ),
          Square(
            index: 8,
          ),
          Square(
            index: 9,
          ),
        ]),
      ],
    );
  }
}

class Square extends StatelessWidget {
  Square({this.index,});
  final index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Consumer<TableOfCases>(
          builder: (context, tableOfCases, child) => GestureDetector(
            onTap: () {},
            child: Container(
                child: Center(
              child: Image.asset(xValue),
            )),
          ),
        ));
  }
}
