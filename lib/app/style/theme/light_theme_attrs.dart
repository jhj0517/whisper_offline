import 'package:flutter/material.dart';

import 'theme_attrs.dart';

class LightThemeAttrs implements ThemeAttrs {
  @override
  ThemeModes get mode => ThemeModes.light;
  @override
  String get name => "Light Theme";
  @override
  IconData get icon => Icons.light_mode_outlined;
  @override
  ThemeData get colors => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const  ColorScheme.light(
        background: Color(0xFFFFFFFF),
        primary: Color(0xFF000000),
        secondary: Color(0xFFE1A7FF),
      ),
      appBarTheme: const AppBarTheme().copyWith(),
      textTheme: const TextTheme().copyWith().apply(
          bodyColor: const Color(0xFF000000)
      )
  );
}