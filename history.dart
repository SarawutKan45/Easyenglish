import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/models/userscore_model.dart';
import 'package:flutter_app_easy_english/utility/style.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String userUid;
  double screenWidth, screenHeight;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    findData();
  }

  findData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        await FirebaseFirestore.instance
            .collection('scores')
            .where('uid', isEqualTo: event.uid)
            .orderBy('time',descending: true )
            .snapshots()
            .listen((event) {
          for (var snapshots in event.docs) {
            Map<String, dynamic> map = snapshots.data();
            UserScoreModel model = UserScoreModel.fromMap(map);
            setState(() {
              widgets.add(createWidget(model));
            });
          }
        });
      });
    });
  }

  Widget createWidget(UserScoreModel model) => Container(
        margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.009, horizontal: screenHeight * 0.01),
        padding: EdgeInsets.all(screenHeight * 0.009),
        height: screenHeight * 0.125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 2,
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
                      margin: EdgeInsets.only(left: screenWidth * 0.1),
                      child: Text(
                        "คะแนน",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Sukhumvit",
                          fontWeight: FontWeight.bold,
                          fontSize: screenHeight * screenWidth * 0.000065,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "วัน-เดือน-ปี-เวลา",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sukhumvit",
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * screenWidth * 0.000065,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                model.score.toString(),
                                style: TextStyle(
                                  color: Colors.black,
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
                    flex: 8,
                    child: Text(
                      model.time.toDate().toString().substring(0,16),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sukhumvit",
                        fontWeight: FontWeight.bold,
                        fontSize: screenHeight * screenWidth * 0.000065,
                      ),
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
      appBar: AppBar(
        title: MyStyle().titleH2('History'),
      ),
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: widgets,
            ),
    );
  }
}
