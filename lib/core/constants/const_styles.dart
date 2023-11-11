import 'package:flutter/material.dart';
import 'package:getx_group_chat_clean/core/constants/const_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConstStyles {
  static var headerTextStyle = GoogleFonts.greatVibes(
    color: ConstColors.kMainColor1,
    letterSpacing: 2.0,
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
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

  static var mainTextStyle = GoogleFonts.greatVibes(
    color: ConstColors.kTextColor,
    letterSpacing: 2.0,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
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
