import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecondFirst extends StatelessWidget {
  const SecondFirst({Key? key}) : super(key: key);

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
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.second_one,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: sizeh,
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.second_two,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: sizeh,
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.second_three,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: sizeh,
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.second_four,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: sizeh,
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.second_five,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: sizeh,
              child: InkWell(
                onTap: () {},
                child: Card(
                  child: Center(
                    child: Text(
                      AppLocalizations.of(context)!.second_six,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
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
