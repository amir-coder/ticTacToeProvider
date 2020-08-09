import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tec_tac_toe/table.dart';

void main() => runApp(MaterialApp(
      home: TecTacToe(),
    ));

//variables

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
    final tableOfCases = Provider.of<TableOfCases>(context);
    return Table(
      border: TableBorder(
        verticalInside: BorderSide(color: Colors.black),
        horizontalInside: BorderSide(color: Colors.black),
      ),
      children: [
        TableRow(children: [
          Square(
            index: 1,
            stateProvider: tableOfCases,
          ),
          Square(
            index: 2,
            stateProvider: tableOfCases,
          ),
          Square(
            index: 3,
            stateProvider: tableOfCases,
          ),
        ]),
        TableRow(children: [
          Square(
            index: 4,
            stateProvider: tableOfCases,
          ),
          Square(
            index: 5,
            stateProvider: tableOfCases,
          ),
          Square(
            index: 6,
            stateProvider: tableOfCases,
          ),
        ]),
        TableRow(children: [
          Square(
            index: 7,
            stateProvider: tableOfCases,
          ),
          Square(
            index: 8,
            stateProvider: tableOfCases,
          ),
          Square(
            index: 9,
            stateProvider: tableOfCases,
          ),
        ]),
      ],
    );
  }
}

class Square extends StatelessWidget {
  Square({this.index, this.stateProvider});
  final index;
  final TableOfCases stateProvider;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Consumer<TableOfCases>(
          builder: (context, tableOfCases, child) => GestureDetector(
            onTap: () => stateProvider.onChangedHandler(index),
            child: Container(
                child: Center(
              child: stateProvider.myValue(this.index) == null
                  ? Container()
                  : Image.asset(stateProvider.myValue(index)),
            )),
          ),
        ));
  }
}
