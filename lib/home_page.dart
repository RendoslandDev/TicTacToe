// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_unnecessary_containers, unused_local_variable, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, sort_child_properties_last, unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //the first player is o;
  List<String> displayExOh = ["", "", "", "", "", "", "", "", ""];
  int ohScore = 0;
  int exScore = 0;
  int tabboxes = 0;

  //fonts
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(children: [
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Player o", style: myNewFontWhite),
                    Text(ohScore.toString(), style: myNewFontWhite),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Player x", style: myNewFontWhite),
                    Text(exScore.toString(), style: myNewFontWhite),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: GridView.builder(
              itemCount: 9,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    _tapped(index);
                  },
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Center(
                        child: Text(
                      displayExOh[index],
                      style: myNewFontWhite,
                    )),
                  ),
                );
              }),
        ),
        Expanded(
          child: Container(
              child: Column(
            children: [
              Text(
                "TIC TAC TOE",
                style: myNewFontWhite,
              ),
            ],
          )),
        ),
      ]),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "o";
        tabboxes += 1;
      } else if (!ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "x";
        tabboxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //first row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    }
    //second row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != "") {
      _showWinDialog(displayExOh[3]);
    }
    //third row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != "") {
      _showWinDialog(displayExOh[6]);
    }
    //first column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    }
    //second column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != "") {
      _showWinDialog(displayExOh[1]);
    }

    //third column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != "") {
      _showWinDialog(displayExOh[2]);
    }
    //check digonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != "") {
      _showWinDialog(displayExOh[6]);
    }
    //check digonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != "") {
      _showWinDialog(displayExOh[0]);
    } else if (tabboxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(title: Text("DRAW"), actions: <Widget>[
            MaterialButton(
                color: Colors.amber,
                child: Text("Play Again"),
                onPressed: () {
                  _clearboard();
                  Navigator.of(context).pop();
                })
          ]);
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
              title: Text("WINNER🏆" + winner),
              actions: <Widget>[
                MaterialButton(
                    color: Colors.amber,
                    child: Text("Play Again"),
                    onPressed: () {
                      _clearboard();
                      Navigator.of(context).pop();
                    })
              ]);
        });

    if (winner == "o") {
      ohScore += 1;
    } else {
      exScore += 1;
    }
  }

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = "";
      }
    });
    tabboxes = 0;
  }
}
