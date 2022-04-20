import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizew = 500;
    double sizeh = 80;
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
              // Card(
              //     color: Colors.amber,
              //     child: InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, '/2_test');
              //       },
              //       child: Column(
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.all(40.0),
              //             child: SizedBox(
              //               width: sizew,
              //               child: Text(
              //                 AppLocalizations.of(context)!.first_test,
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   fontSize: 25,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     )),
              Card(
                  color: Colors.amber[700],
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: SizedBox(
                            width: sizew,
                            child: Text(
                              AppLocalizations.of(context)!.settings,
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
