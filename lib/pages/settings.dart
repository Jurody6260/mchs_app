import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxheight = 50;
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
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
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
