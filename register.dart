import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/models/user_model.dart';
import 'package:flutter_app_easy_english/utility/dialog.dart';
import 'package:flutter_app_easy_english/utility/style.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name, email, password;
  int score = 0;
  bool redEye = true;

  //ตรวจสอบว่าเชื่อมต่อกับ firebase ได้หรือไม่
  Future<Null> createAccount() async {
    await Firebase.initializeApp().then((value) async {
      //print('### Firebase Initialize Success###');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        //print('สร้างบัญชีสำเร็จ');
        await value.user.updateProfile(displayName: name).then((value2) async {
          String uid = value.user.uid;
          //print('อัพเดตบัญชีสำเร็จ uid = $uid');
          UserModel model = UserModel(email: email, name: name, score: score);
          Map<String, dynamic> data = model.toMap();

          await FirebaseFirestore.instance
              .collection('user')
              .doc(uid)
              .set(data)
              .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/home', (route) => false));
        });
      }).catchError((onError) =>
          normalDialog(context, onError.code, onError.message));
    });
  }

  Container buildLogo() {
    return Container(width: screenWidth * 0.4, child: MyStyle().showLogo());
  }

  Container buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.02, bottom: screenHeight * 0.02),
      child: MyStyle().titleH1White('EASY ENGLISH'),
    );
  }

  Container buildInfomation() {
    return Container(
      height: screenHeight * 0.55,
      width: screenWidth * 0.85,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 8,
        child: Column(
          children: <Widget>[
            buildText(),
            buildName(),
            buildEmail(),
            buildPassword(),
            buildsigninButton(),
          ],
        ),
      ),
    );
  }
  
  Container buildText() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.02),
      child: MyStyle().titleH1('สมัครสมาชิก'),
    );
  }

  Container buildName() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.03),
      width: screenWidth * 0.7,
      height: screenHeight * 0.1,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
          labelText: 'ชื่อ',
          labelStyle: MyStyle().labelTextStyle(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildEmail() {
    return Container(
      width: screenWidth * 0.7,
      height: screenHeight * 0.1,
      child: TextField(
        onChanged: (value) => email = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          labelText: 'อีเมล',
          labelStyle: MyStyle().labelTextStyle(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      width: screenWidth * 0.7,
      height: screenHeight * 0.1,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: redEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(
                // true ทำหลัง ? false ทำหลัง :
                redEye
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye_sharp,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  redEye = !redEye;
                });
              }),
          prefixIcon: Icon(Icons.person),
          labelText: 'รหัสผ่าน',
          labelStyle: MyStyle().labelTextStyle(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().darkColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: MyStyle().lightColor)),
        ),
      ),
    );
  }

  Container buildsigninButton() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.02),
      child: SizedBox(
        width: screenWidth * 0.5,
        height: screenHeight * 0.08,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18.0)),
          color: Color(0xFF6A2C70),
          onPressed: () {
            if ((name?.isEmpty ?? true) ||
                (email?.isEmpty ?? true) ||
                (password?.isEmpty ?? true)) {
              //print('มีช่องว่าง');
              normalDialog(context, 'มีช่องว่าง', 'กรุณากรอกข้อมุลให้ครบ');
            } else {
              //print('ส่งค่า');
              createAccount();
            }
          },
          child: MyStyle().titleH2White('สมัครสมาชิก'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Color(0xFF6A2C70),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildLogo(),
                buildTitle(),
                buildInfomation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
