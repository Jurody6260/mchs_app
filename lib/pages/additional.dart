import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../funcs/mybar.dart';

class Additional extends StatelessWidget {
  const Additional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizew = 500;
    return Scaffold(
      appBar: myBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                  color: Colors.amber,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/intro');
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: SizedBox(
                                width: sizew,
                                child: Text(
                                  AppLocalizations.of(context)!.intro_title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              
              Card(
                  color: Colors.amber,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/2_map');
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SizedBox(
                            width: sizew,
                            child: Text(
                              AppLocalizations.of(context)!.first_map,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  color: Colors.amber,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/2_test');
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SizedBox(
                            width: sizew,
                            child: Text(
                              AppLocalizations.of(context)!.first_test,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Card(
                  color: Colors.amber[700],
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/additional_four');
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SizedBox(
                            width: sizew,
                            child: Text(
                              AppLocalizations.of(context)!.additional_four,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
