import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:final_mchs_app/provider.dart';
import 'package:final_mchs_app/pages/first.dart';

import '../funcs/mybar.dart';
import '../main.dart';

class LangSelect extends StatelessWidget {
  const LangSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myBar(),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Card(
                  color: Colors.amber,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async {
                                // var box = await Hive.openBox<dynamic>('myBox');
                                // box.put('local', 'uz');
                                // box.close();
                                MyApp.of(context)!.setLocale(
                                    Locale.fromSubtags(languageCode: 'uz'),
                                    'uz');
                                Navigator.pushNamed(context, "/");
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Aholining barcha qatlamini zilzilaga tayyorlash uchun mobil ilova',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'O`zbekcha',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: Colors.amber,
                  child: InkWell(
                    onTap: () {
                      final provider =
                          Provider.of<LocaleProvider>(context, listen: false);
                      provider.setLocale(Locale('ru'));
                      Navigator.pushNamed(context, "/");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () async {
                                // var box = await Hive.openBox<dynamic>('myBox');
                                // box.put('local', 'ru');
                                // box.close();
                                MyApp.of(context)!.setLocale(
                                    Locale.fromSubtags(languageCode: 'ru'),
                                    'ru');
                                Navigator.pushNamed(context, "/");
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Мобильное приложение для подготовки всех слоев населения к землетрясениям',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Русский',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                MyApp.of(context)!.setLocale(
                                    Locale.fromSubtags(languageCode: 'en'),
                                    'en');
                                Navigator.pushNamed(context, "/");
                                // final provider = Provider.of<LocaleProvider>(
                                //     context,
                                //     listen: false);
                                // provider.setLocale(Locale('en'));
                                // Navigator.pop(context);
                                // Navigator.pop(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'A mobile application for preparing all segments of the population for earthquakes',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'English',
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
