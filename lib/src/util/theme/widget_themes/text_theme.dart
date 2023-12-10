import 'package:agri_x/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class STextTheme {
  STextTheme._();

  static TextTheme lightTextTheme = TextTheme(
      headline1: GoogleFonts.montserrat(
        color: SDarkColor,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.montserrat(
        color: SDarkColor,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
      headline3: GoogleFonts.poppins(
        color: SDarkColor,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
      ),
      headline4: GoogleFonts.poppins(
        color: SDarkColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      headline5: GoogleFonts.poppins(
        color: SDarkColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      headline6: GoogleFonts.poppins(
        color: SDarkColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: GoogleFonts.poppins(
        color: SDarkColor,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: GoogleFonts.poppins(
        color: SDarkColor,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.black45,
        fontSize: 16,
      ));

  static TextTheme darkTextTheme = TextTheme(
      headline2: GoogleFonts.montserrat(
        color: Colors.black87,
        fontSize: 24,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.black45,
        fontSize: 16,
      ));
}
