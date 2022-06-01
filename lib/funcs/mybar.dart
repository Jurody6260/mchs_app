import 'package:flutter/material.dart';

AppBar myBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/logo.jpg"),
        ),
        Container(
            padding: const EdgeInsets.all(8.0), child: Text('Zilzila APP'))
      ],
    ),
    centerTitle: true,
  );
}
