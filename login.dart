import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/screens/register.dart';
import 'package:flutter_app_easy_english/utility/dialog.dart';
import 'package:flutter_app_easy_english/utility/style.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool redEye = true;

  Future<Null> checkLogin() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
          context, '/home', (route) => false))
          .catchError((value) => normalDialog(
          context, 'เข้าสู่ระบบไม่สำเร็จ', 'กรุณาตรวจสอบอีเมลหรือรหัสผ่านให้ถูกต้อง'));
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
      height: screenHeight * 0.5,
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
            buildEmail(),
            buildPassword(),
            buildloginButton(),
          ],
        ),
      ),
    );
  }

  Container buildText() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.02),
      child: MyStyle().titleH1('เข้าสู่ระบบ'),
    );
  }

  Container buildEmail() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.03),
      width: screenWidth * 0.7,
      height: screenHeight * 0.1,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
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
      margin: EdgeInsets.only(top: screenHeight * 0.02),
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

  Container buildloginButton() {
    return Container(
      margin: EdgeInsets.only(top: screenHeight * 0.02),
      width: screenWidth * 0.5,
      height: screenHeight * 0.08,
      child: TextButton(
        onPressed: () {
          if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            print('มีช่องว่าง');
            normalDialog(context, 'มีช่องว่าง', 'กรุณากรอกข้อมุลให้ครบ');
          } else {
            checkLogin();
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
          backgroundColor: MaterialStateProperty.all(MyStyle().primaryColor),
        ),
        child: MyStyle().titleH2White('เข้าสู่ระบบ'),
      ),
    );
  }

  Row buildRegister() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(screenHeight*0.02),
          child: MyStyle().titleNormalWhite('ยังไม่ลงทะเบียน ?'),
        ),
        TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                    Color.fromRGBO(255, 255, 255, 0.2))),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return RegisterPage();
              }));
            },
            child: MyStyle().titleNormal('ลงทะเบียนสมาชิก')),
      ],
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
                buildRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
