import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/screens/login.dart';


class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  //### เป็นการเปลี่ยนหน้าจอไปยังหน้า homepage หลังจากอยู่ที่หน้าจอ splashscreen
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginPage(),
      ));
    });
  }


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFF6A2C70),
    body: Center(
      child: Text(
        "Easy English",
        style: TextStyle(
          fontSize: 50.0,
          color: Colors.white,
          fontFamily: "Sukhumvit",
        ),
      ),
    ),
  );
}}

