import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightModeTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.black,
  secondaryHeaderColor: const Color(0xff3b22a1),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(color: Colors.black),
  ),
  cardColor: Colors.white,
  colorScheme: ColorScheme.light(
    background: Color(0xfff8f8f8),
  ),
);

ThemeData darkModeTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  secondaryHeaderColor: const Color(0xff3b22a1),
  textTheme: TextTheme(
    bodyMedium: GoogleFonts.poppins(color: Colors.white),
  ),
  cardColor: const Color(0xff070606),
  colorScheme: ColorScheme.dark(
    background: Color(0xff06090d),
  ),
);
