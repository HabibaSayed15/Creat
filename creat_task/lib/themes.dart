import 'package:creat_task/colors.dart';
import 'package:creat_task/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightThem = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    // datePickerTheme: DatePickerThemeData(
    //   backgroundColor: Colors.white,
    //   dayForegroundColor: const MaterialStatePropertyAll(Colors.black),
    //   headerBackgroundColor: ColorP.primary,
    //   headerForegroundColor: Colors.white,
    // ),
    // timePickerTheme: const TimePickerThemeData(
    //     backgroundColor: Colors.white, hourMinuteColor: Colors.black),
    iconTheme: IconThemeData(color: ColorP.primary),
    textTheme: TextTheme(
      displayLarge: titles(),
      displayMedium: subtitles(),
      displaySmall: smalltitles(),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorP.primary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorP.primary,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red))));

final darkThem = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.white,
    // datePickerTheme: DatePickerThemeData(
    //   backgroundColor: Colors.black,
    //   dayForegroundColor: const MaterialStatePropertyAll(Colors.white),
    //   headerBackgroundColor: ColorP.primary,
    //   headerForegroundColor: Colors.black,
    // ),
    // timePickerTheme: const TimePickerThemeData(
    //     backgroundColor: Colors.black,
    //     hourMinuteColor: Colors.white,
    //     hourMinuteTextColor: Colors.white),

    iconTheme: IconThemeData(color: ColorP.primary),
    textTheme: TextTheme(
      displayLarge: titles(colort: Colors.white),
      displayMedium: subtitles(),
      displaySmall: smalltitles(colort: Colors.white),
    ),
    fontFamily: GoogleFonts.poppins().fontFamily,
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorP.primary,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: ColorP.primary,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red))));
