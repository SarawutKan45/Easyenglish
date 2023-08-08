import 'package:flutter/material.dart';
double screenWidth, screenHeight;

class MyStyle {
  Color primaryColor = Color(0xff6a2c70);
  Color lightColor = Color(0xff9a599f);
  Color darkColor = Color(0xff3d0044);

  Color nontextTheme = Color(0xff6495ED);
  Color readingTheme = Color(0xff457fca);
  Color structureTheme = Color(0xff766161);
  Color matchTheme = Color(0xff761D6B);
  Color conversationTheme = Color(0xff005C97);
  Color translateTheme = Color(0xff761D6B);

  Color button1 = Color(0xFFD06A6A);
  Color button2 = Color(0xFFFFB359);
  Color button3 = Color(0xFF5DADE2);

  TextStyle darkStyle() => TextStyle(color: darkColor);
  TextStyle whiteStyle() => TextStyle(color: Colors.white);
  TextStyle greyStyle() => TextStyle(color: Colors.grey);

  Widget titleAppbar(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontSize: screenHeight * screenWidth * 0.000085,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget titleNormal(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      fontSize: screenHeight * screenWidth * 0.000055,
    ),
  );

  Widget titleNormalWhite(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: screenHeight * screenWidth * 0.000055,
    ),
  );

  Widget titleH1(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.000095,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
    ),
  );

  Widget titleH1White(String string) => Text(
    string,
    style: TextStyle(
      fontSize: 30,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  Widget titleH1Gray(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.000095,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
  );

  Widget titleH2(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.000075,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
    ),
  );

  Widget titleH2White(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.000075,
      fontFamily: "Sukhumvit",
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  Widget titleH2Gray(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.000075,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.grey[400],
    ),
  );

  Widget titleH3(String string) => Text(
    string,
    style: TextStyle(
      fontSize: 16,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
    ),
  );

  Widget titleH3White(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.00006,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
  Widget quizH1White(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.00007,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  Widget titleRank(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.white,
    ),
  );

  Widget titleLessonWhite(String string) => Text(
    string,
    style: TextStyle(
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
      fontSize: screenHeight * screenWidth * 0.000056,
      color: Colors.white,
    ),
  );

  Widget titleQuestionWhite(String string) => Text(
    string,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenHeight * screenWidth * 0.000065,
      fontFamily: "Sukhumvit",
      color: Colors.white,
    ),
  );


  Widget titleChoiceWhite(String string) => Text(
    string,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: screenHeight * screenWidth * 0.000065,
      color: Colors.white,
      fontFamily: "Sukhumvit",
    ),
    maxLines: 2,
  );

  Widget titleTimeWhite(String string) => Text(
    string,
    style: TextStyle(
      fontSize: screenHeight * screenWidth * 0.000125,
      fontFamily: "Sukhumvit",
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );


  Widget titleQuestion(String string) => Text(
    string,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      fontFamily: "Sukhumvit",
    ),
  );


  Widget titleChoice(String string) => Text(
    string,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
      fontFamily: "Sukhumvit",
    ),
    maxLines: 2,
  );

  Widget titleTime(String string) => Text(
    string,
    style: TextStyle(
      fontSize: 30.0,
      fontFamily: "Sukhumvit",
      fontWeight: FontWeight.bold,
    ),
  );

  TextStyle labelTextStyle() => TextStyle(
    fontSize: screenHeight * screenWidth * 0.000040,
    fontFamily: "Sukhumvit",
    fontWeight: FontWeight.bold,
  );

  TextStyle primarytextStyle() => TextStyle(
    fontFamily: "Sukhumvit",
    fontWeight: FontWeight.bold,
  );

  TextStyle whitetextStyle() => TextStyle(
    fontFamily: "Sukhumvit",
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  Widget showLogo() => Image(
        image: AssetImage(
          'assets/images/logo.png',
        ),
      );
}
