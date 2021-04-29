import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/custom_dialog.dart';
import 'package:tictactoe/game_button.dart';

import 'okdialog.dart';

class HomesPage extends StatefulWidget {
  @override
  _HomesPageState createState() => _HomesPageState();
}

int counter1 = 0, counter2 = 0;
var n1 = "0", n2 = "0";

class _HomesPageState extends State<HomesPage> {
  List<GameButton> buttonsList;
  var player1;
  var player2;
  var activeplayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    activeplayer = 1;

    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activeplayer == 1) {
        gb.text = "X";
        gb.bg = Colors.orange[600];
        activeplayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.indigo;
        activeplayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => CustomDialog(
                  "DRAW!!!", "Press RESET button to start again", resetGame));
        }
      }
    });
  }

  int checkWinner() {
    var winner = -1;
    if ((player1.contains(1) && player1.contains(2) && player1.contains(3)) ||
        (player1.contains(4) && player1.contains(5) && player1.contains(6)) ||
        (player1.contains(7) && player1.contains(8) && player1.contains(9)) ||
        (player1.contains(1) && player1.contains(4) && player1.contains(7)) ||
        (player1.contains(2) && player1.contains(5) && player1.contains(8)) ||
        (player1.contains(3) && player1.contains(6) && player1.contains(9)) ||
        (player1.contains(1) && player1.contains(5) && player1.contains(9)) ||
        (player1.contains(3) && player1.contains(5) && player1.contains(7))) {
      winner = 1;
    }

    if ((player2.contains(1) && player2.contains(2) && player2.contains(3)) ||
        (player2.contains(4) && player2.contains(5) && player2.contains(6)) ||
        (player2.contains(7) && player2.contains(8) && player2.contains(9)) ||
        (player2.contains(1) && player2.contains(4) && player2.contains(7)) ||
        (player2.contains(2) && player2.contains(5) && player2.contains(8)) ||
        (player2.contains(3) && player2.contains(6) && player2.contains(9)) ||
        (player2.contains(1) && player2.contains(5) && player2.contains(9)) ||
        (player2.contains(3) && player2.contains(5) && player2.contains(7))) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        counter1 = counter1 + 1;
        n1 = counter1.toString();
        showDialog(
            context: context,
            builder: (_) =>
                OkDialog("WON THE MATCH!!!", "Player 1 Won", resetGame));
      } else if (winner == 2) {
        counter2 = counter2 + 1;
        n2 = counter2.toString();
        showDialog(
            context: context,
            builder: (_) =>
                OkDialog("WON THE MATCH!!!", "Player 2 Won", resetGame));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  void reset() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    counter1 = 0;
    counter2 = 0;
    n1 = counter1.toString();
    n2 = counter2.toString();
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("TIC  TAC  TOE",
            style: GoogleFonts.aladin(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/images/img2.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 75,
              width: 75,
            ),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 9.0,
                      mainAxisSpacing: 9.0),
                  itemCount: buttonsList.length,
                  itemBuilder: (context, index) => new SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: RaisedButton(
                          padding: EdgeInsets.all(8.0),
                          onPressed: buttonsList[index].enabled
                              ? () => playGame(buttonsList[index])
                              : null,
                          child: Text(
                            buttonsList[index].text,
                            style: new TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          color: buttonsList[index].bg,
                          disabledColor: buttonsList[index].bg,
                        ),
                      )),
            ),
            Form(
                child: Column(children: [
              Container(
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                        fillColor: Colors.orange,
                        labelText: 'PLAYER 1 : $n1',
                        labelStyle: GoogleFonts.aladin(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                            fontSize: 25),
                        enabled: false,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        prefixIcon: Icon(
                          Icons.emoji_emotions,
                          color: Colors.orange,
                        )),
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 125, left: 30, right: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'PLAYER 2 : $n2',
                      labelStyle: GoogleFonts.aladin(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                          fontSize: 25),
                      enabled: false,
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      prefixIcon: Icon(
                        Icons.emoji_emotions,
                        color: Colors.indigo,
                      )),
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
