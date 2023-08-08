import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/games/Match/match_g1.dart';
import 'package:flutter_app_easy_english/games/Match/match_g2.dart';
import 'package:flutter_app_easy_english/games/Match/match_g4.dart';
import 'package:flutter_app_easy_english/games/Match/match_g3.dart';
import 'package:flutter_app_easy_english/games/Match/match_g5.dart';
import 'package:flutter_app_easy_english/games/conversation/conversation_g1.dart';
import 'package:flutter_app_easy_english/games/conversation/conversation_g2.dart';
import 'package:flutter_app_easy_english/games/conversation/conversation_g3.dart';
import 'package:flutter_app_easy_english/games/conversation/conversation_g4.dart';
import 'package:flutter_app_easy_english/games/conversation/conversation_g5.dart';
import 'package:flutter_app_easy_english/games/listening/listening_g1.dart';
import 'package:flutter_app_easy_english/games/listening/listening_g2.dart';
import 'package:flutter_app_easy_english/games/listening/listening_g3.dart';
import 'package:flutter_app_easy_english/games/listening/listening_g4.dart';
import 'package:flutter_app_easy_english/games/listening/listening_g5.dart';
import 'package:flutter_app_easy_english/games/nontext/nontext_g1.dart';
import 'package:flutter_app_easy_english/games/nontext/nontext_g2.dart';
import 'package:flutter_app_easy_english/games/nontext/nontext_g3.dart';
import 'package:flutter_app_easy_english/games/nontext/nontext_g4.dart';
import 'package:flutter_app_easy_english/games/nontext/nontext_g5.dart';
import 'package:flutter_app_easy_english/games/structure/structure_g1.dart';
import 'package:flutter_app_easy_english/games/structure/structure_g2.dart';
import 'package:flutter_app_easy_english/games/structure/structure_g3.dart';
import 'package:flutter_app_easy_english/games/structure/structure_g4.dart';
import 'package:flutter_app_easy_english/games/structure/structure_g5.dart';
import 'games/Translate/translate_g1.dart';
import 'games/Translate/translate_g2.dart';
import 'games/Translate/translate_g3.dart';
import 'games/Translate/translate_g4.dart';
import 'games/Translate/translate_g5.dart';

class RouteGenerator {
  static List<String> myRandomPages = ['Conversation1','Conversation2','Conversation3','Conversation4','Conversation5', 'NonText1','NonText2','NonText3','NonText4','NonText5', 'Structure1','Structure2','Structure3','Structure4','Structure5','Listening1','Listening2','Listening3','Listening4','Listening5','Translate1','Translate2','Translate3','Translate4','Translate5','Match1','Match2','Match3','Match4','Match5'];

  static String getRandomNameOfRoute() {
    return myRandomPages[Random().nextInt(myRandomPages.length)];
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'Conversation1':
        return MaterialPageRoute(builder: (_) => Conversation1());
      case 'Conversation2':
        return MaterialPageRoute(builder: (_) => Conversation2());
      case 'Conversation3':
        return MaterialPageRoute(builder: (_) => Conversation3());
      case 'Conversation4':
        return MaterialPageRoute(builder: (_) => Conversation4());
      case 'Conversation5':
        return MaterialPageRoute(builder: (_) => Conversation5());
      case 'NonText1':
        return MaterialPageRoute(builder: (_) => NonText1());
      case 'NonText2':
        return MaterialPageRoute(builder: (_) => NonText2());
      case 'NonText3':
        return MaterialPageRoute(builder: (_) => NonText3());
      case 'NonText4':
        return MaterialPageRoute(builder: (_) => NonText4());
      case 'NonText5':
        return MaterialPageRoute(builder: (_) => NonText5());
      case 'Structure1':
        return MaterialPageRoute(builder: (_) => Structure1());
      case 'Structure2':
        return MaterialPageRoute(builder: (_) => Structure2());
      case 'Structure3':
        return MaterialPageRoute(builder: (_) => Structure3());
      case 'Structure4':
        return MaterialPageRoute(builder: (_) => Structure4());
      case 'Structure5':
        return MaterialPageRoute(builder: (_) => Structure5());
      case 'Listening1':
        return MaterialPageRoute(builder: (_) => Listening1());
      case 'Listening2':
        return MaterialPageRoute(builder: (_) => Listening2());
      case 'Listening3':
        return MaterialPageRoute(builder: (_) => Listening3());
      case 'Listening4':
        return MaterialPageRoute(builder: (_) => Listening4());
      case 'Listening5':
        return MaterialPageRoute(builder: (_) => Listening5());
      case 'Translate1':
        return MaterialPageRoute(builder: (_) => Translate1());
      case 'Translate2':
        return MaterialPageRoute(builder: (_) => Translate2());
      case 'Translate3':
        return MaterialPageRoute(builder: (_) => Translate3());
      case 'Translate4':
        return MaterialPageRoute(builder: (_) => Translate4());
      case 'Translate5':
        return MaterialPageRoute(builder: (_) => Translate5());
      case 'Match1':
        return MaterialPageRoute(builder: (_) => Match1());
      case 'Match2':
        return MaterialPageRoute(builder: (_) => Match2());
      case 'Match3':
        return MaterialPageRoute(builder: (_) => Match3());
      case 'Match4':
        return MaterialPageRoute(builder: (_) => Match4());
      case 'Match5':
        return MaterialPageRoute(builder: (_) => Match5());
    }
  }
}
