import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyButton());
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  var defaultText = "Spanish numbers";
  int counter = 0;
  List<String> nu = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten"
  ];
  List<String> spa = [
    "Uno",
    "Dos",
    "Tres",
    "Cuatro",
    "Cinco",
    "Seis",
    "Seite",
    "Ocho",
    "Nueve",
    "Diez"
  ];
  List<Color> color = [
    Colors.white,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.black,
    Colors.purple,
    Colors.amber,
    Colors.purpleAccent,
    Colors.lime
  ];
  var colo = Colors.white;
  void displayNum() {
    setState(() {
      defaultText =
          (counter + 1).toString() + "-" + nu[counter] + "-" + spa[counter];
      if (counter < 9) {
        counter++;
      } else {
        counter = 0;
      }
    });
  }

  var colob = Colors.black;
  void bgchange() {
    int random = Random().nextInt(9);
    setState(() {
      colo = color[random];
    });
  }

  void buttoncolor() {
    int rando = Random().nextInt(9);
    setState(() {
      colob = color[rando];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spanish count",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.teal,
      ),
      home: Scaffold(
        backgroundColor: colo,
        appBar: AppBar(
          title: Text("Spanish count"),
        ),
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                defaultText,
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.orange,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.5, 1.5),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      )
                    ]),
              ),
              Padding(padding: EdgeInsets.all(15)),
              RaisedButton(
                child: Text("Call Number",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () => {
                  bgchange(),
                  displayNum(),
                  buttoncolor(),
                },
                color: colob,
                splashColor: Colors.orange,
              )
            ],
          )),
        ),
      ),
    );
  }
}
