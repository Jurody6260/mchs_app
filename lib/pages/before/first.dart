import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class Before1 extends StatelessWidget {
  const Before1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizefs = 18;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.jpg"),
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Zilzila APP'))
          ],
        ),
        centerTitle: true,
      ),
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
                        AppLocalizations.of(context)!.before1_1,
                        style: TextStyle(
                          fontSize: sizefs,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ElevatedButton(
                            child: Text(
                              AppLocalizations.of(context)!.before_url,
                            ),
                            onPressed: () {
                              launch(AppLocalizations.of(context)!.before_url);
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

// void _launchURL() async {
//   String _url = AppLocalizations.of(context)!.before_url;
//   if (!await launch(_url)) throw 'Could not launch $_url';
// }
