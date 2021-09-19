import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'pages/first.dart';
import 'pages/second.dart';
import 'pages/settings.dart';

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
            '/second': (context) => SecondPage(),
            '/settings': (context) => Settings()
          }),
    );
