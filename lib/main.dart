import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/2_after.dart';
import 'pages/2_in_time.dart';
import 'pages/after/five.dart';
import 'pages/before/first.dart';
import 'pages/before/fourth.dart';
import 'pages/before/second.dart';
import 'pages/before/third.dart';
import 'pages/first.dart';
import 'pages/in_time/first.dart';
import 'pages/in_time/fourth.dart';
import 'pages/in_time/second.dart';
import 'pages/in_time/third.dart';
import 'pages/after/first.dart';
import 'pages/after/second.dart';
import 'pages/after/third.dart';
import 'pages/after/fourth.dart';
import 'pages/intro.dart';
import 'pages/lang_select.dart';
import 'pages/2_before.dart';
import 'pages/map.dart';
import 'pages/settings.dart';
import 'pages/test.dart';
import 'pages/third_first.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  String? _localef;

  @override
  Widget build(BuildContext context) {
    // проверка на то что язык устройства поддерживается
    // Future<String> isSupp() async {
    //   Locale initialLocale = Localizations.localeOf(context);
    //   if (AppLocalizations.supportedLocales.contains(initialLocale)) {
    //     return initialLocale as String;
    //   } else {
    //     return 'en';
    //   }
    // }

// При первом входе локаль будет иметь язык системы
    Future<void> trueLocale() async {
      var box = await Hive.openBox<dynamic>('myBox');
      _localef = await box.get('local');
      box.close();
      if (_localef != null) {
        _locale = Locale(_localef!, '');
      } else {
        _locale = _localef as Locale?;
      }
    }

    trueLocale();
    if (_locale == null) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) =>
              AppLocalizations.of(context)!.applicationTitle,
          initialRoute: '/',
          routes: {
            '/': (context) => FirstPage(),
            '/2_before': (context) => Before(),
            '/before_1': (context) => Before1(),
            '/before_2': (context) => Before2(),
            '/before_3': (context) => Before3(),
            '/before_4': (context) => Before4(),
            '/2_in_time': (context) => InTime(),
            '/in_time_1': (context) => InTime1(),
            '/in_time_2': (context) => InTime2(),
            '/in_time_3': (context) => InTime3(),
            '/in_time_4': (context) => InTime4(),
            '/2_after': (context) => After(),
            '/after_1': (context) => After1(),
            '/after_2': (context) => After2(),
            '/after_3': (context) => After3(),
            '/after_4': (context) => After4(),
            '/after_5': (context) => After5(),
            '/2_map': (context) => MapSeys(),
            '/2_test': (context) => Test(),
            '/settings': (context) => Settings(),
            '/third': (context) => ThirdFirst(),
            '/LangSelect': (context) => LangSelect(),
            '/intro': (context) => Intro(),
          });
    } else {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: _locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) =>
              AppLocalizations.of(context)!.applicationTitle,
          initialRoute: '/',
          routes: {
            '/': (context) => FirstPage(),
            '/2_before': (context) => Before(),
            '/before_1': (context) => Before1(),
            '/before_2': (context) => Before2(),
            '/before_3': (context) => Before3(),
            '/before_4': (context) => Before4(),
            '/2_in_time': (context) => InTime(),
            '/in_time_1': (context) => InTime1(),
            '/in_time_2': (context) => InTime2(),
            '/in_time_3': (context) => InTime3(),
            '/in_time_4': (context) => InTime4(),
            '/2_after': (context) => After(),
            '/after_1': (context) => After1(),
            '/after_2': (context) => After2(),
            '/after_3': (context) => After3(),
            '/after_4': (context) => After4(),
            '/after_5': (context) => After5(),
            '/2_map': (context) => MapSeys(),
            '/2_test': (context) => Test(),
            '/settings': (context) => Settings(),
            '/third': (context) => ThirdFirst(),
            '/LangSelect': (context) => LangSelect(),
            '/intro': (context) => Intro(),
          });
    }
  }

  void futureBox(code) async {
    var box = await Hive.openBox<dynamic>('myBox');
    await box.put('local', code);
    box.close();
  }

  void setLocale(Locale value, String code) {
    setState(() {
      _locale = value;
      futureBox(code);
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Hive.registerAdapter(LocaleAdapter());
  await Hive.initFlutter();
  return runApp(MyApp());
}
