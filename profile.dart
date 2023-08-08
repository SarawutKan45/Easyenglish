import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/screens/chart.dart';
import 'package:flutter_app_easy_english/screens/history.dart';
import 'package:flutter_app_easy_english/utility/style.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double screenWidth, screenHeight;
  String userUid, displayName, email, score;

  Container buildImageProfile() {
    return Container(
      margin: EdgeInsets.only(top: screenWidth * 0.02),
      child: Image(
        height: screenHeight * 0.25,
        image: AssetImage(
          'assets/images/profile.png',
        ),
      ),
    );
  }

  Container buildImageHistory() {
    return Container(
      margin: EdgeInsets.only(top: screenWidth * 0.02),
      child: Image(
        height: screenHeight * 0.15,
        image: AssetImage(
          'assets/images/history.png',
        ),
      ),
    );
  }

  Container buildImageExit() {
    return Container(
      margin: EdgeInsets.only(top: screenWidth * 0.02),
      child: Image(
        height: screenHeight * 0.15,
        image: AssetImage(
          'assets/images/exit.png',
        ),
      ),
    );
  }

  Container buildName() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().titleH1Gray('สวัสดี '),
          MyStyle().titleH1Gray(displayName == null ? 'Name' : displayName),
        ],
      ),
    );
  }

  Container buildEmailScore() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().titleH2Gray(email == null ? 'Email' : email),
          MyStyle().titleH2('คะแนนรวมของคุณคือ '),
          MyStyle().titleH1(score == null ? 'Score' : score),
        ],
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      height: 20,
      thickness: 3,
      indent: 20,
      endIndent: 20,
    );
  }

  Align buildSigout() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
            top: screenHeight * 0.02, bottom: screenHeight * 0.02),
        width: screenWidth * 0.45,
        height: screenWidth * 0.12,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: MyStyle().button1,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: MyStyle().titleNormal('EasyEnglish'),
                content: MyStyle().titleNormal('คุณต้องออกจากระบบใช่หรือไม่'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      await Firebase.initializeApp().then((value) async {
                        await FirebaseAuth.instance.signOut().then((value) =>
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (route) => false));
                      });
                    },
                    child: MyStyle().titleNormal('ตกลง'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: MyStyle().titleNormal('ยกเลิก'),
                  ),
                ],
              ),
            );
          },
          child: MyStyle().titleH2White('ออกจากระบบ'),
        ),
      ),
    );
  }

  Align buildHistory() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
            top: screenHeight * 0.02, bottom: screenHeight * 0.02),
        width: screenWidth * 0.45,
        height: screenWidth * 0.12,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: MyStyle().button2,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return HistoryPage();
            }));
          },
          child: MyStyle().titleH2White('ประวัติการเล่น'),
        ),
      ),
    );
  }

  Align buildChart() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(
            top: screenHeight * 0.02, bottom: screenHeight * 0.02),
        width: screenWidth * 0.45,
        height: screenWidth * 0.12,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: MyStyle().button3,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ChartPage();
            }));
          },
          child: MyStyle().titleH2White('สถิติ / สัปดาห์'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<Null> findDisplayName() async {
    await Firebase.initializeApp().then((value) async {
      //print('initialize Success');
      await FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          displayName = event.displayName;
          userUid = event.uid;
          email = event.email;
        });
        //print(userUid);
        readProfile();
      });
    });
  }

  Future readProfile() {
    FirebaseFirestore.instance
        .collection('user')
        .where('email', isEqualTo: email)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //print(doc["name"]);
        //print(doc["score"].toString());
        setState(() {
          score = doc["score"].toString();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.03),
                child: MyStyle().titleH1('โปรไฟล์'),
              ),
              buildImageProfile(),
              buildName(),
              buildDivider(),
              buildEmailScore(),
              buildDivider(),
              Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02),
                child: MyStyle().titleH1('ประวัติการเล่น'),
              ),
              buildImageHistory(),
              buildHistory(),
              buildChart(),
              buildDivider(),
              buildImageExit(),
              buildSigout(),
            ],
          ),
        ),
      ),
    );
  }
}
