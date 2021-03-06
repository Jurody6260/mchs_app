import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../funcs/mybar.dart';

class MapSeys extends StatelessWidget {
  const MapSeys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var path = "assets/images/map_seys.png";
    if (Localizations.localeOf(context) == Locale('uz')) {
      path = "assets/images/map_seys_uz.png";
    } else if (Localizations.localeOf(context) == Locale('en')) {
      path = "assets/images/map_seys_en.png";
    }
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage(path),
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.map_title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: sizefs,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.map_info,
                        style: TextStyle(
                          fontSize: sizefs,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(
                            child: Text('http://smrm.uz/'),
                            onPressed: () {
                              launch('http://smrm.uz/');
                            },
                          ),
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
