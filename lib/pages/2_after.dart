import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../funcs/mybar.dart';

class After extends StatelessWidget {
  const After({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeh = 250;
    double sizefs = 25;
    return Scaffold(
      appBar: myBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sizeh,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/after_1');
                },
                child: Card(
                  color: Colors.amberAccent,
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
                onTap: () {
                  Navigator.pushNamed(context, '/after_2');
                },
                child: Card(
                  color: Colors.amberAccent,
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
                onTap: () {
                  Navigator.pushNamed(context, '/after_3');
                },
                child: Card(
                  color: Colors.amberAccent,
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
                onTap: () {
                  Navigator.pushNamed(context, '/after_4');
                },
                child: Card(
                  color: Colors.amberAccent,
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
          ],
        ),
      ),
    );
  }
}
