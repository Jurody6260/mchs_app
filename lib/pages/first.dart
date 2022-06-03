import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../funcs/mybar.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

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
                          Navigator.pushNamed(context, '/2_before');
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: SizedBox(
                                width: sizew,
                                child: Text(
                                  AppLocalizations.of(context)!.first_first,
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
                      Navigator.pushNamed(context, '/2_in_time');
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SizedBox(
                            width: sizew,
                            child: Text(
                              AppLocalizations.of(context)!.first_second,
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
                      Navigator.pushNamed(context, '/2_after');
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SizedBox(
                            width: sizew,
                            child: Text(
                              AppLocalizations.of(context)!.first_third,
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
                    Navigator.pushNamed(context, '/additional_for_first_page');
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: SizedBox(
                          width: sizew,
                          child: Text(
                            AppLocalizations.of(context)!
                                .additional_for_first_page,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
