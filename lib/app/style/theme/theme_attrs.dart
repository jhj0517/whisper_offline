import 'package:flutter/material.dart';

enum ThemeModes{
  light,
  dark
}

abstract class ThemeAttrs {
  ThemeModes get mode;
  String get name;
  IconData get icon;
  ThemeData get colors;
}
