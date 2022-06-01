import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../funcs/mybar.dart';

class Before3 extends StatelessWidget {
  const Before3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizefs = 18;
    return Scaffold(
      appBar: myBar(),
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
                      Text(
                        AppLocalizations.of(context)!.before1_3,
                        style: TextStyle(
                          fontSize: sizefs,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(
                            child: Text(
                              AppLocalizations.of(context)!.before_url_3,
                            ),
                            onPressed: () {
                              launch(
                                  AppLocalizations.of(context)!.before_url_3);
                            },
                          ),
                        ),
                      )
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
