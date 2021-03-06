import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../funcs/mybar.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxheight = 50;
    return Scaffold(
        appBar: myBar(),
        body: Center(
          child: Column(
            children: [
              Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/LangSelect');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/LangSelect');
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: boxheight,
                            ),
                            Text(
                              AppLocalizations.of(context)!.choose_Lan,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: boxheight,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/LangSelect');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/ChooseRegion');
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: boxheight,
                            ),
                            Text(
                              AppLocalizations.of(context)!.choose_region,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            SizedBox(
                              height: boxheight,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
