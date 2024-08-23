import 'dart:io';

import 'package:adaptive_date_picker/src/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const title = 'Home Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: HomePage.title.text()),
        child: buildBody(),
      );
    }

    return Scaffold(
      appBar: AppBar(title: HomePage.title.text()),
      body: buildBody(),
    );
  }

  void onDateTimeChanged(DateTime? value) {
    dateTime = value;
    setState(() {});
  }

  Widget buildBody() {
    return [
      (dateTime ?? '').toString().text(style: context.textTheme.titleLarge),

      //
      DatePicker.adaptive(onChanged: onDateTimeChanged).center(),
    ].column(mainAxisSize: MainAxisSize.min).center();
  }
}
