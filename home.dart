import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_easy_english/grammars/grammar.dart';
import 'package:flutter_app_easy_english/lesson/lesson.dart';
import 'package:flutter_app_easy_english/screens/games.dart';
import 'package:flutter_app_easy_english/screens/profile.dart';
import 'package:flutter_app_easy_english/screens/rank.dart';
import 'package:flutter_app_easy_english/utility/style.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentWidget = ProfilePage();
  int selectedIndex = 0;
  final screen = [
    ProfilePage(),
    LessonPage(),
    grammarpage(),
    GamesPage(),
    RankPage()
  ];

  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );
  ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);
  SnakeShape snakeShape = SnakeShape.circle;
  bool showSelectedLabels = true;
  bool showUnselectedLabels = true;
  Color selectedColor = MyStyle().lightColor;
  Color unselectedColor = Colors.white;
  Color containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    //แอพอยู่ในแนวตั้ง
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: MyStyle().titleAppbar('Easy English'),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: screen[selectedIndex],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        backgroundColor: MyStyle().primaryColor,
        selectedLabelStyle: MyStyle().labelTextStyle(),
        unselectedLabelStyle: MyStyle().labelTextStyle(),
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home, color: Colors.white),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.book, color: Colors.white),
              label: 'บทเรียน'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.graduationCap, color: Colors.white),
              label: 'ไวยกรณ์'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gamepad, color: Colors.white),
              label: 'เกม'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.trophy, color: Colors.white),
              label: 'อันดับ')
        ],
      ),
    );
  }
}
