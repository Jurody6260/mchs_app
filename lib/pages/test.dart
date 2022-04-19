import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Card(
                color: Colors.amber[100],
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage("assets/images/map_seys.png"),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.map_info,
                        style: TextStyle(
                          fontSize: sizefs,
                        ),
                      ),
                    ],
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
