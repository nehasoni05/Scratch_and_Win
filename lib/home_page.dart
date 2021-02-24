import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer advancedPlayer = AudioPlayer();
  AudioCache audiocache = AudioCache();
  AssetImage blank = AssetImage("images/blank.png");
  AssetImage unlucky = AssetImage("images/sad.png");
  AssetImage lucky = AssetImage("images/money.png");
  List<String> itemArray;
  int luckyNumber;
  int count = 0;
  String message = "Let's start the game";

  generateRandomNumber() {
    int random = Random().nextInt(25);
    setState(() {
      luckyNumber = random;
      print(luckyNumber);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemArray = List<String>.generate(25, (index) => "empty");
    generateRandomNumber();
  }

  displayMessage() {
    message = "You have reached maximum trials 😢😢";
    Delay();
  }

  Delay() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        this.resetGame();
        count = 0;
      });
    });
  }

  resetGame() {
    setState(() {
      itemArray = List<String>.filled(25, "empty");
      this.message = "Let's start the game";
      this.count = 0;
    });
    generateRandomNumber();
  }

  AssetImage getImage(int index) {
    String currentState = itemArray[index];
    switch (currentState) {
      case "lucky":
        return lucky;
        break;
      case "unlucky":
        return unlucky;
        break;
    }
    return blank;
  }

  playGame(int index) {
    if (luckyNumber == index) {
      setState(() {
        itemArray[index] = "lucky";
        audiocache.play("cash.wav");
        this.message = "Yay you got it🎉🎉";
        Delay();
      });
    } else if (luckyNumber != index && count <= 5) {
      setState(() {
        itemArray[index] = "unlucky";
        count++;
      });
      if (count == 5) {
        audiocache.play("aww.mp3");
        displayMessage();
      }
      if (count == 4) {
        this.message = "Last chance🥺🥺";
      }
      if (count == 3) {
        this.message = "Two more left😳😳 ";
      }
      if (count == 2) {
        this.message = "Stay calm,You can win😌😌 ";
      }
      if (count == 1) {
        this.message = "There is a long way to go🥱🥱";
      }
    }
  }

  showAll() {
    setState(() {
      itemArray = List<String>.filled(25, "unlucky");
      itemArray[luckyNumber] = "lucky";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scratch and Win")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: 25,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 5,
                  childAspectRatio: 1),
              itemBuilder: (context, i) => SizedBox(
                width: 50,
                height: 50,
                child: RaisedButton(
                  padding: EdgeInsets.all(1),
                  onPressed: () {
                    playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(100, 12, 100, 12),
                  color: Colors.blue[400],
                  child: Text(this.message))
            ],
          ),
          Container(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    onPressed: () {
                      this.resetGame();
                    },
                    color: Colors.black,
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      "Start Again",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    onPressed: () {
                      this.showAll();
                    },
                    color: Colors.black,
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text(
                      "Show All",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          )),
        ],
      ),
    );
  }
}
