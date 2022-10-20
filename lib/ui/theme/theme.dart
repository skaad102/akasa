import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeAKasa {
  static const Color btnBackground = Color(0xFFA2DF30);
  static const Color btnPlay = Color(0xFF56b82c);
  static const Color btnZone = Color(0xFFf8ffea);
  static const Color btnBorderZone = Color(0xFF56b82c);
  static const Color btnBack = Color(0xFFff6f6f);
  static const Color btnBorderBack = Color(0xFFa61b1b);
  static const Color btnSpeak = Color(0xFFa2df30);
  static const Color btnBorderSpeak = Color(0xFF32470b);
  static const Color btnHear = Color(0xFFa888ff);
  static const Color btnBorderHear = Color(0xFF3800d1);
  static const Color btnPerfil = Color(0xFF35ddb6);
  static const Color btnBorderPerfil = Color(0xFF0d4a3c);
  static TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.inter(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline2: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText1: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    button: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    caption: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    overline: GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );
  static ThemeData light() => ThemeData(
        textTheme: lightTextTheme,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.white,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Colors.green,
          selectionHandleColor: Colors.black,
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: btnBackground,
          inactiveTrackColor: Colors.grey,
          trackHeight: 4.0,
          thumbColor: btnBorderZone,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
          overlayColor: Colors.green.withAlpha(32),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: btnPlay,
          foregroundColor: Colors.white,
        ),
      );
}
