import 'package:flutter/material.dart';
import 'package:mausam/screens/loading.dart';
import 'package:mausam/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mausam",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        
      ),
      routes: {
        "/" : (context) => LoadingPage(),
      "/home" : (context) => HomePage(),
      "/loading" : (context) => LoadingPage(),
      },
    );
  }
}
