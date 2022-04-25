import 'package:flutter/material.dart';

ThemeData greenTheme = ThemeData(
  splashColor: Colors.green.withOpacity(0.7),
  primaryColor: Colors.green[900],
  highlightColor: Colors.green[900],

  //цвет подсказки конца списка
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.green),

  //тень алерта например
  //shadowColor: Colors.red,

  //цвет фона скаффолда
  //scaffoldBackgroundColor: Colors.red

  //тоже красит фон скаффолда
  //canvasColor: Colors.red,
);