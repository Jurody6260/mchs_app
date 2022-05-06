import 'dart:async';
import 'package:final_mchs_app/pages/first.dart';
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
      MaterialPageRoute(builder: (context) => FirstPage()),
      (Route<dynamic> route) => false,
    );
  });
}
