import 'package:flutter/material.dart';
import 'package:quip_sync/core/constants/const_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstStyles {
  // greyQo
  // fleurDeLeah
  //islandMoments
  //sevillana
  //sendFlowers
  //mrBedfort
  //jimNightshade
  static var headerTextStyle = GoogleFonts.islandMoments(
    color: ConstColors.kMainColor1,
    letterSpacing: 5.0,
    fontSize: 35.sp,
    fontWeight: FontWeight.bold,
    shadows: [
      BoxShadow(
        color: Colors.grey.shade100, // Shadow color
        offset: const Offset(1.0, 1.0),
        blurRadius: 8.0,
      ),
      const BoxShadow(
        color: Colors.black12, // Highlight color
        offset: Offset(-1.0, -1.0),
        blurRadius: 8.0,
      ),
    ],
  );

  static var mainTextStyle = GoogleFonts.islandMoments(
    color: ConstColors.kTextColor,
    letterSpacing: 3.0,
    fontSize: 23.sp,
    fontWeight: FontWeight.bold,
    shadows: [
      BoxShadow(
        color: Colors.grey.shade100, // Shadow color
        offset: const Offset(1.0, 1.0),
        blurRadius: 8.0,
      ),
      const BoxShadow(
        color: Colors.black12, // Highlight color
        offset: Offset(-1.0, -1.0),
        blurRadius: 8.0,
      ),
    ],
  );
}
