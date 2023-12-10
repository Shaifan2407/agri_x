import 'package:agri_x/src/util/theme/widget_themes/text_field_theme.dart';
import 'package:agri_x/src/util/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: STextTheme.lightTextTheme,
    inputDecorationTheme: STextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: STextTheme.lightTextTheme,
  );
}
