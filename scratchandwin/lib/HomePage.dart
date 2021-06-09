import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//TODO:IMPORTING IMAGE ASSETS
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");
  AssetImage circle = AssetImage("images/circle.png");

//TODO:GET THE ARRAY AND VARIABLES
  List<String> itemArray = [];
  int luckyNumber = -1;
  int count = 0;
  bool win = false;
  String message = "YOU HAVE 6 MOVES";

//TODO:INTIALIZE THE ARRAY AND VARIABLES
  @override
  void initState() {
    super.initState();
    setState(() {
      this.win = false;
      this.message = "YOU HAVE 6 MOVES";
      this.count = 0;
      this.itemArray = List<String>.generate(16, (index) => "empty");
      getLuckyNumber();
    });
  }

//TODO:GET LUCKY NUMBER
  getLuckyNumber() {
    int random = Random().nextInt(16);
    setState(() {
      this.luckyNumber = random;
    });
  }

//TODO:GET IMAGE METHODS
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
    return circle;
  }

//TODO:PLAYGAME METHODS

  playGame(int index) {
    if (!this.win && this.count < 6) {
      this.count++;
      this.message = "YOU HAVE " + (6 - this.count).toString() + " MOVES LEFT";
      if (luckyNumber == index) {
        setState(() {
          this.win = true;
          this.message = "YOU WON";
          itemArray[index] = "lucky";
        });
      } else {
        setState(() {
          itemArray[index] = "unlucky";
        });
      }
    } else {
      setState(() {
        if (!this.win && this.count == 6) {
          this.message = "GAME DRAWN, RESET | SHOW ALL";
        } else {
          this.message = "YOU CAN'T PLAY YOU CAN RESET!";
        }
      });
    }
  }

//TODO:RESET GAME METHODS
  resetGame() {
    setState(() {
      this.win = false;
      this.itemArray = List<String>.filled(16, "empty");
      this.count = 0;
      this.message = "YOU HAVE 6 MOVES";
      getLuckyNumber();
    });
  }

//TODO:SHOW ALL METHOD
  showAll() {
    setState(() {
      this.itemArray = List<String>.filled(16, "unlucky");
      this.itemArray[luckyNumber] = "lucky";
      this.message = "YOU HACKED THE GAME!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      appBar: AppBar(
        title: Text('Scratch and win'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(25.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: itemArray.length,
              itemBuilder: (context, i) => SizedBox(
                width: 50.0,
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(i),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(13.0),
              child: Text(
                this.message,
                style: TextStyle(
                  color: Colors.blueGrey[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                this.showAll();
              },
              color: Colors.blueGrey[800],
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Show All',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              onPressed: () {
                this.resetGame();
              },
              color: Colors.blueGrey[800],
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Reset',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
