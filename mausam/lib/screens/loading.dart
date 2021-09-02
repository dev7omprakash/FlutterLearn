import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mausam/helper/helper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String city = "MADHUBANI";
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;

  Future<void> startApp(String city) async {
    Helper instance = Helper(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp.toString(),
        "hum_value": hum.toString(),
        "air_speed_value": air_speed.toString(),
        "des_value": des.toString(),
        "main_value": main.toString(),
        "icon_value": icon.toString(),
        "city_value": city.toString(),
      });
    });
  }

  @override
  void initState() {
    startApp(this.city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 180,
              ),
              Image.asset(
                "images/logo.png",
                height: 240,
                width: 240,
              ),
              Text(
                "Mausam App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "dev7omprakash",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}