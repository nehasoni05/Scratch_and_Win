import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Game Rules"),
        ),
        body: Center(
          child: new Column(
            children: <Widget>[
              new Text("The rules for this game are pretty simple:-\n\n",
                  textAlign: TextAlign.left,
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              new Text(
                  "(1.) You use your mouse to scratch the designated area on the screen to reveal the symbols, cards or money values etc.\n\n",
                  textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 20)),
              new Text(
                  "(2.) This game allows the user to select any 5 block from the total 25 present out of which only one has the prize.\n\n",
                  textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 20)),
              new Text(
                  "(3.) If you figure out which block it is on or before 5th try then you win, else you lose and the game will reset itself after 2 seconds.\n\n",
                  textAlign: TextAlign.left,
                  style: new TextStyle(fontSize: 20)),
              new Text(
                "GOOD LUCK👍✌",
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
