import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/games/gametype.dart';
import 'package:flutter_app_easy_english/games/roulette.dart';
import 'package:flutter_app_easy_english/utility/style.dart';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  double screenWidth, screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          padding: EdgeInsets.all(screenWidth * 0.01),
          margin: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            children: [
              MyStyle().titleH1('เกมตอบคำถาม'),
              Image(
                width: screenHeight * 0.15,
                image: AssetImage(
                  'assets/images/random.png',
                ),
              ),
              MyStyle().titleH2('สุ่มคำถามทั้งหมด'),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.012),
                width: screenWidth * 0.65,
                height: screenHeight * 0.075,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Roulette();
                    }));
                  },
                  color: MyStyle().button1,
                  child: MyStyle().titleH2White('สุ่ม'),
                ),
              ),
              Divider(
                height: 30,
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
              Image(
                width: screenHeight * 0.15,
                image: AssetImage(
                  'assets/images/type.png',
                ),
              ),
              MyStyle().titleH2('เลือกคำถามตามหมวดหมู่'),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.012),
                width: screenWidth * 0.65,
                height: screenHeight * 0.075,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return GameTypePage();
                    }));
                  },
                  color: MyStyle().button2,
                  child: MyStyle().titleH2White('เลือกหมวดหมู่'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
