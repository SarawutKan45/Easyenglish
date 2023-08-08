import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

double f_width,f_height;


class MyGrammar{
  static String fontFamily = "Sukhumvit";
  static Color  colorNormal = Colors.black;
  static Color  colorIconShare = Color(0xFF6A2C70);
  static Color  colorIconStar = Colors.red[800];
  static Color  colorTextSub = Colors.purple;
  static double fontSizeNormal = f_width * f_height * 0.00005 ;
  static double fontSizeSub = f_width * f_height * 0.00006 ;
  static double iconSize = f_width * f_height * 0.00007 ;


  Widget appbarGrammar(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontSize: f_width * f_height * 0.000085,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
  Widget textInBox(String string) => Text(
    string,
    style: TextStyle(
      fontSize: f_width * f_height * 0.000045,
      fontFamily: "Sukhumvit",
    ),
  );

  Widget textBold(String string) => Text(
    string,
    style: TextStyle(
      fontSize: f_width * f_height * 0.00005,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: "Sukhumvit",
    ),
  );

  Widget textNomal(String string) => Text(
    string,
    style: TextStyle(
      fontSize: f_width * f_height * 0.00005,
      color: Colors.black,
      fontFamily: "Sukhumvit",
    ),
  );

  Widget orangeText(String string) => Text(
    string,
    style: TextStyle(
      fontSize: f_width * f_height * 0.00006,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.deepOrangeAccent,
    ),
  );
  Widget redText(String string) => Text(
    string,
    style: TextStyle(
      fontSize: f_width * f_height * 0.000085,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.pink,
    ),
  );
  Widget purpleText(String string) => Text(
    string,
    style: TextStyle(
      fontSize: f_width * f_height * 0.000055,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.purple,
    ),
  );
  Widget labelText(String string) => Text(
    string,
    style: TextStyle(
      fontSize: f_width * f_height * 0.00005,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: "Sukhumvit",
    ),
  );
  Widget menuButtom(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontSize: f_width * f_height * 0.00005,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
  Widget menuHeadButtom(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontSize: f_width * f_height * 0.00009,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );
  Widget subTextBlack(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontSize: f_width * f_height * 0.00010,
      fontWeight: FontWeight.bold,
    ),
  );
  Widget iconShare() => Icon(
    FontAwesomeIcons.share,
    color: Color(0xFF6A2C70),
    size: f_width * f_height * 0.00007,
  );
  Widget iconStar() => Icon(
    FontAwesomeIcons.starOfLife,
    color: Colors.red[800],
    size: f_width * f_height * 0.00007,
  );
  Widget iconComment() => Icon(
    FontAwesomeIcons.commentDots,
    color: Colors.black45,
    size: f_width * f_height * 0.00015,
  );

}