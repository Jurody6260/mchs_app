import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'pages/first.dart';
import 'pages/lang_select.dart';
import 'pages/second.dart';
import 'pages/settings.dart';
import 'pages/third_first.dart';

void main() => runApp(
      MaterialApp(
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
          }),
    );
