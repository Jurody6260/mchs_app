import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizew = 500;
    double sizeh = 100;
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
      body: Center(
        child: Column(
          children: [
            Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(
                        height: sizeh / 2 + 25,
                      ),
                      SizedBox(
                        width: sizew,
                        height: sizeh,
                        child: Text(
                          "ТАЪЛИМ МУАССАСАЛАРИ УЧУН",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(
                        height: sizeh / 3,
                      ),
                      SizedBox(
                        width: sizew,
                        height: sizeh,
                        child: Text(
                          "ДАВОЛАШ-СОГЛОМЛАШТИРИШ МУАССАСАЛАРИ УЧУН",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(
                        height: sizeh / sizeh,
                      ),
                      SizedBox(
                        width: sizew,
                        height: sizeh,
                        child: Text(
                          "ХОКИМИЯТ, ВАЗИРЛИК, КОРХОНА, ИДОРА ВА ТАШКИЛОТ УЧУН",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
