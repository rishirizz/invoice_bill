import 'package:flutter/material.dart';

var darkTheme = const ColorScheme(
  primary: Color(0xffffffff),
  primaryVariant: Color(0xff484848),
  secondary: Color(0xffff3838),
  secondaryVariant: Color(0xffff7263),
  surface: Color(0xff000000),
  background: Color(0xff000000),
  error: Color(0xffffffff),
  onPrimary: Color(0xffffffff),
  onSecondary: Color(0xffffffff),
  onSurface: Color(0xff000000),
  onBackground: Color(0xffffffff),
  onError: Color(0xffffffff),
  brightness: Brightness.dark,
);

final ThemeData myDarkTheme = ThemeData(
  colorScheme: darkTheme.copyWith(secondary: darkTheme.secondary),
);

var lightTheme = const ColorScheme(
  primary: Color(0xff282828),
  primaryVariant: Color(0xff505050),
  onPrimary: Color(0xffffffff),
  secondary: Color(0xffff3838),
  secondaryVariant: Color(0xffc4000f),
  onSecondary: Color(0xffffffff),
  surface: Color(0xffffffff),
  onSurface: Color(0xff7f7f7f),
  background: Color(0xfff6f6f6),
  onBackground: Color(0xff7f7f7f),
  error: Color(0xffc4000f),
  onError: Color(0xff7f7f7f),
  brightness: Brightness.light,
);

final ThemeData myLightTheme = ThemeData(
  highlightColor: const Color(0xffff3838),
  fontFamily: 'Roboto',
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    //foregroundColor: Colors.black,
  ),
  colorScheme: lightTheme.copyWith(secondary: lightTheme.secondary),
);
