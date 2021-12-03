import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThirdFirst extends StatelessWidget {
  const ThirdFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeh = 200;
    double sizefs = 25;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('ZILZILA MOBILE'))
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sizeh,
              child: Card(
                color: Colors.amberAccent,
                child: Center(
                  child: Text(
                    'Видео ва матн материаллар',
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
