import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../funcs/mybar.dart';

class After5 extends StatelessWidget {
  const After5({Key? key}) : super(key: key);

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
                  child: Column(children: [
                    Text(
                      AppLocalizations.of(context)!.second_five,
                      style: TextStyle(
                        fontSize: sizefs,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/table_after_5_1.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_2,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_2.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_3,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_3.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_4,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/prapushiniy.jpg"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_5,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_4.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_6,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_5.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_7,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_6.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_8,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_7.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_9,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_8.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_10,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/after_5_9-1.png"),
                          ),
                          Image(
                            image: AssetImage("assets/images/after_5_9-2.png"),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_11,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_10.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_12,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/after_5_11-1.png"),
                          ),
                          Image(
                            image: AssetImage("assets/images/after_5_11-2.png"),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_13,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Image(
                        image: AssetImage("assets/images/after_5_12.png"),
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_14,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/after_5_13-1.png"),
                          ),
                          Image(
                            image: AssetImage("assets/images/after_5_13-2.png"),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.after1_5_15,
                      style: TextStyle(
                        fontSize: sizefs,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
