import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xff6C5ECF);
Color secondaryColor = Color(0xff38ABBE);
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color bgColor1 = Color(0xff1F1D2B);
Color bgColor2 = Color(0xff2B2937);
Color bgColor3 = Color(0xff242231);
Color bgColor4 = Color(0xff252836);
Color bgColor5 = Color(0xff2B2844);
Color bgColor6 = Color(0xff3F4251);
Color bgColor7 = Color(0xff2F3344);
Color primaryTextColor = Color(0xffF1F0F2);
Color secondaryTextColor = Color(0xff999999);
Color blackTextColor = Color(0xff2E2E2E);

ThemeData darkMode = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: bgColor1,elevation: 0,centerTitle: true,),
  scaffoldBackgroundColor: bgColor3,
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w600, color: primaryTextColor),
    titleMedium: GoogleFonts.poppins(
        fontWeight: FontWeight.w500, color: primaryTextColor),
    bodyMedium: GoogleFonts.poppins(color: secondaryTextColor),
    bodySmall: GoogleFonts.poppins(color: secondaryTextColor),
    labelMedium: GoogleFonts.poppins(color: primaryTextColor),
    labelLarge: GoogleFonts.poppins(color: primaryTextColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
);
