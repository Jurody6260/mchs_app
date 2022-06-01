import 'dart:async';
import 'package:final_mchs_app/pages/lang_select.dart';
import 'package:flutter/material.dart';

class IntroGlobus extends StatelessWidget {
  const IntroGlobus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    alo(context);
    return Center(
      child: Image.asset("assets/gif/glb.gif"),
    );
  }
}

void alo(context) async {
  Timer(Duration(seconds: 5), () {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LangSelect()),
      (Route<dynamic> route) => false,
    );
  });
}
