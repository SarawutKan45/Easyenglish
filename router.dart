import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/screens/home.dart';
import 'package:flutter_app_easy_english/screens/login.dart';
import 'package:flutter_app_easy_english/screens/rank.dart';
import 'package:flutter_app_easy_english/screens/register.dart';
import 'package:flutter_app_easy_english/screens/splash.dart';

final Map<String, WidgetBuilder> routes = {
  '/rank': (BuildContext context) => RankPage(),
  '/login': (BuildContext context) => LoginPage(),
  '/home': (BuildContext context) => HomePage(),
  '/register': (BuildContext context) => RegisterPage(),
  '/splash': (BuildContext context) => splashscreen(),
};
