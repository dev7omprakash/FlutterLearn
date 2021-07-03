import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url =
      "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true";

  List covidData = [];
  bool isloaded = true;
  int data = 0;

  @override
  void initState() {
    super.initState();
    this.getData();
    this.isloaded = true;
  }

  Future getData() async {
    var response = await http.get(
      Uri.parse(url),
    );
    List data = jsonDecode(response.body)["activeCases"];
    print(data);

    setState(() {
      this.covidData = data;
      isloaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Update"),
      ),
      body: Container(
        child: Center(
          child: isloaded
              ? CircularProgressIndicator()
              : Text(
                  this.covidData.toString(),
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
        ),
      ),
    );
  }
}
