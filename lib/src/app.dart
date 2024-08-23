import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './pages/home.page.dart';

class App extends StatelessWidget {
  final AppType _type;
  final String title;

  const App({
    super.key,
    required AppType type,
    this.title = 'Adaptive Date Picker',
  }) : _type = type;

  App.adaptive({super.key, this.title = 'Adaptive Date Picker'})
      : _type = Platform.isIOS ? AppType.iOS : AppType.android;

  const App.android({super.key, this.title = 'Adaptive Date Picker'})
      : _type = AppType.android;

  const App.iOS({super.key, this.title = 'Adaptive Date Picker'})
      : _type = AppType.iOS;

  @override
  Widget build(BuildContext context) {
    if (_type == AppType.iOS) {
      return const CupertinoApp(home: HomePage());
    }

    return MaterialApp(
      title: title,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),

      //
      home: const HomePage(),
    );
  }
}

enum AppType { iOS, android, adaptive }
