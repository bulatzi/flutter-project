import 'package:flutter/material.dart';

final ThemeData CompanyThemeData = new ThemeData(
  brightness: Brightness.light,
  //primarySwatch: CompanyColors.green,
  primaryColor: CompanyColors.green[200],
  primaryColorBrightness: Brightness.light,
);

class CompanyColors {
  CompanyColors._();
  static const Map<int, Color> green = const <int, Color> {
    200: const Color(0xFFA5D6A7),
    300: const Color(0xFF81C784),
  };
}