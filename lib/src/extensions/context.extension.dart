import 'package:flutter/material.dart';

extension $Content on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  double get deviceHeight => _mediaQuery.size.height;
  double get deviceWidth => _mediaQuery.size.height;

  // Navigator
  NavigatorState get _navigator => Navigator.of(this);
  void pop<T>([T? result]) => _navigator.pop<T>(result);

  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
