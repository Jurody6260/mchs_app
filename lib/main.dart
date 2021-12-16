import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/first.dart';
import 'pages/lang_select.dart';
import 'pages/second.dart';
import 'pages/settings.dart';
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
      _locale = await box.get('local', defaultValue: _locale);
      box.close();
    }

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
            '/second': (context) => SecondFirst(),
            '/settings': (context) => Settings(),
            '/third': (context) => ThirdFirst(),
            '/LangSelect': (context) => LangSelect(),
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
            '/second': (context) => SecondFirst(),
            '/settings': (context) => Settings(),
            '/third': (context) => ThirdFirst(),
            '/LangSelect': (context) => LangSelect(),
          });
    }
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  return runApp(MyApp());
}
