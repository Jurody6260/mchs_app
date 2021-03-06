import 'package:flutter/material.dart';

import '../funcs/mybar.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThirdFirst extends StatelessWidget {
  const ThirdFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeh = 200;
    double sizefs = 25;
    return Scaffold(
      appBar: myBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sizeh,
              child: Card(
                color: Colors.amberAccent,
                child: Center(
                  child: Text(
                    'Video va matn materiallar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: sizefs,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
