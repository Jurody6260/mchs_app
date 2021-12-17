import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mchs_/provider.dart';

import '../main.dart';

class LangSelect extends StatelessWidget {
  const LangSelect({Key? key}) : super(key: key);

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
                          onPressed: () async {
                            // var box = await Hive.openBox<dynamic>('myBox');
                            // box.put('local', 'uz');
                            // box.close();
                            MyApp.of(context)!.setLocale(
                                Locale.fromSubtags(languageCode: 'uz'), 'uz');
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: boxheight,
                              ),
                              Text(
                                'O`zbekcha',
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
              ),
              Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {
                    final provider =
                        Provider.of<LocaleProvider>(context, listen: false);
                    provider.setLocale(Locale('ru'));
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            // var box = await Hive.openBox<dynamic>('myBox');
                            // box.put('local', 'ru');
                            // box.close();
                            MyApp.of(context)!.setLocale(
                                Locale.fromSubtags(languageCode: 'ru'),'ru');
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: boxheight,
                              ),
                              Text(
                                'Русский',
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
              ),
              Card(
                color: Colors.amber,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            MyApp.of(context)!.setLocale(
                                Locale.fromSubtags(languageCode: 'en'),'en');
                            Navigator.pop(context);
                            Navigator.pop(context);
                            // final provider = Provider.of<LocaleProvider>(
                            //     context,
                            //     listen: false);
                            // provider.setLocale(Locale('en'));
                            // Navigator.pop(context);
                            // Navigator.pop(context);
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: boxheight,
                              ),
                              Text(
                                'English',
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
              ),
            ],
          ),
        ));
  }
}
