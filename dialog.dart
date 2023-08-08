import 'package:flutter/material.dart';
import 'package:flutter_app_easy_english/utility/style.dart';

Future<Null> normalDialog(
    BuildContext context, String title, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: ListTile(
        leading: MyStyle().showLogo(),
        title: Text(
          title,
          style: MyStyle().primarytextStyle(),
        ),
        subtitle: Text(
          message,
          style: MyStyle().primarytextStyle(),
        ),
      ),
      children: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('ตกลง'))
      ],
    ),
  );
}
