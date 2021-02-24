import 'package:flutter/material.dart';
import 'home_page.dart';
import 'rules_page.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static AudioPlayer advancedPlayer = AudioPlayer();
  AudioCache audiocache = AudioCache(fixedPlayer: advancedPlayer);

  String two = "2.mp3";
  AssetImage home = AssetImage("images/scratchandwin.png");
  @override
  void initState() {
    super.initState();
    audiocache.play(two);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scratch and Win"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Container(
                  height: 256,
                  width: 256,
                  child: Stack(
                    children: [
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                      Center(
                          child: Image(
                        image: home,
                      ))
                    ],
                  )),
              SizedBox(
                height: 94,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Let's Play Game"),
                    color: Colors.lightBlue[400],
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        advancedPlayer.pause();
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Game Rules"),
                    color: Colors.lightBlue[400],
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        18,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        advancedPlayer.stop();
                        audiocache.play("dice.wav");
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RulesPage()));
                    },
                  )
                ],
              )
            ],
          ),
        ));
  }
}
