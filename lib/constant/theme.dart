import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0xff6C5ECF);
Color secondaryColor = Color(0xff38ABBE);
Color alertColor = Color(0xffED6363);
Color priceColor = Color(0xff2C96F1);
Color bgColor1 = Color(0xff1F1D2B);
Color bgColor2 = Color(0xff2B2937);
Color bgColor3 = Color(0xff242231);
Color primaryTextColor = Color(0xffF1F0F2);
Color secondaryTextColor = Color(0xff999999);


ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: bgColor1,
  textTheme: TextTheme(
    headlineSmall: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: primaryTextColor),
    titleMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500,color:primaryTextColor),
    labelLarge: GoogleFonts.poppins()
  )

);