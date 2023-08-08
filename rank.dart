import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/models/user_model.dart';
import 'package:flutter_app_easy_english/utility/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {
  double screenWidth, screenHeight;
  int i = 0;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  readData() async {
    await Firebase.initializeApp().then((value) async {
      // print('Initialize Success');
      await FirebaseFirestore.instance
          .collection('user')
          .orderBy('score', descending: true)
          .snapshots()
          .listen((event) {
        // print('snapshots = ${event.docs}');
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          // print('map = $map');
          UserModel model = UserModel.fromMap(map);
          // print('vocab = ${model.name}');
          i++;
          setState(() {
            widgets.add(createWidget(model));
          });
        }
      });
    });
  }

  Widget createWidget(UserModel model) => Container(
        margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.009, horizontal: screenHeight * 0.01),
        padding: EdgeInsets.all(screenHeight * 0.009),
        height: screenHeight * 0.125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: i == 1
              ? Color(0xFFDAA520)
              : i == 2
                  ? Color(0xFFC0C0C0)
                  : i == 3
                      ? Color(0xFFC06020)
                      : Colors.white,
          border: Border.all(
            width: 2,
            color: i == 1 || i == 2 || i == 3
                ? Colors.transparent
                : MyStyle().primaryColor,
          ),
        ),
        child: Container(
          width: screenWidth * 0.5,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'อันดับที่ ',
                            style: TextStyle(
                              color: i == 1 || i == 2 || i == 3
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: "Sukhumvit",
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * screenWidth * 0.000065,
                            ),
                          ),
                          Text(
                            i.toString(),
                            style: TextStyle(
                              color: i == 1 || i == 2 || i == 3
                                  ? Colors.white
                                  : Colors.black,
                              fontFamily: "Sukhumvit",
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * screenWidth * 0.000065,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.05),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: screenWidth * 0.3,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    model.name,
                                    style: TextStyle(
                                      color: i == 1 || i == 2 || i == 3
                                          ? Colors.white
                                          : Colors.black,
                                      fontFamily: "Sukhumvit",
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          screenHeight * screenWidth * 0.000065,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'คะแนน : ',
                                style: TextStyle(
                                  color: i == 1 || i == 2 || i == 3
                                      ? Colors.white
                                      : Colors.black,
                                  fontFamily: "Sukhumvit",
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      screenHeight * screenWidth * 0.000065,
                                ),
                              ),
                              Text(
                                model.score.toString(),
                                style: TextStyle(
                                  color: i == 1 || i == 2 || i == 3
                                      ? Colors.white
                                      : Colors.black,
                                  fontFamily: "Sukhumvit",
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      screenHeight * screenWidth * 0.000075,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      i == 1
                          ? FontAwesomeIcons.crown
                          : i == 2
                              ? FontAwesomeIcons.trophy
                              : i == 3
                                  ? FontAwesomeIcons.medal
                                  : null,
                      color: Colors.white,
                      size: screenWidth * 0.08,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: widgets,
            ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
