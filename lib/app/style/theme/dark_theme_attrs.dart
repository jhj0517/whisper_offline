import 'package:flutter/material.dart';

import 'theme_attrs.dart';

class DarkThemeAttrs implements ThemeAttrs {
  @override
  ThemeModes get mode => ThemeModes.dark;
  @override
  String get name => "Dark Theme";
  @override
  IconData get icon => Icons.nights_stay;
  @override
  ThemeData get colors => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        background: Color(0xFF000000),
        primary: Color(0xFFFFFFFF),
        secondary: Color(0xFFE1A7FF),
      ),
      appBarTheme: const AppBarTheme().copyWith(),
      textTheme: const TextTheme().copyWith().apply(
          bodyColor: const Color(0xFFFFFFFF)
      )
  );
}