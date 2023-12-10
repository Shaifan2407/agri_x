import 'package:agri_x/src/constants/colors.dart';
import 'package:flutter/material.dart';

class STextFormFieldTheme {
  STextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: SSecondaryColor,
    floatingLabelStyle: const TextStyle(color: SSecondaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(width: 2, color: SSecondaryColor),
    ),
  );
}
