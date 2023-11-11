import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/const_colors.dart';
import '../constants/const_styles.dart';

class DefaultTextField extends StatefulWidget {
  final String hnt;
  final TextEditingController controller;
  final IconData icon;
  final bool obscureText;
  final bool isEnabled;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final Color borderColor;
  final double? wd;
  final int maxLength;
  final int maxLines;

  const DefaultTextField({
    Key? key,
    required this.hnt,
    this.validator,
    this.onChanged,
    required this.controller,
    required this.icon,
    this.obscureText = false,
    this.isEnabled = true,
    required this.keyboardType,
    this.borderColor = Colors.white,
    this.wd,
    this.maxLength = 0,
    this.maxLines = 0,
  }) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool pass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pass = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: .5.h),
      width: 80.w,
      child: TextFormField(
        enabled: widget.isEnabled,
        maxLength: widget.maxLength != 0 ? widget.maxLength : null,
        maxLines: widget.obscureText
            ? 1
            : widget.maxLines != 0
            ? widget.maxLines
            : null,
        inputFormatters: widget.keyboardType == TextInputType.number
            ? [
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ]
            : widget.keyboardType == TextInputType.phone
            ? [
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ]
            : null,
        style:
        ConstStyles.mainTextStyle.copyWith(fontWeight: FontWeight.bold),
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        obscureText: pass,
        controller: widget.controller,
        decoration: InputDecoration(

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(
                color: ConstColors.kMainColor3, width: 5.sp, style: BorderStyle.solid),
            gapPadding: 10,
          ),       focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.sp),
          borderSide: BorderSide(
              color: ConstColors.kMainColor3, width: 5.sp, style: BorderStyle.solid),
          gapPadding: 10,
        ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(
                color: ConstColors.kMainColor3, width: 5.sp, style: BorderStyle.solid),
            gapPadding: 10,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(
                color: Colors.red, width: 5.sp, style: BorderStyle.solid),
            gapPadding: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(
                color: ConstColors.kMainColor3, width: 5.sp, style: BorderStyle.solid),
            gapPadding: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.sp),
            borderSide: BorderSide(
                color: ConstColors.kMainColor3, width: 5.sp, style: BorderStyle.solid),
            gapPadding: 10,
          ),
          suffixIcon: widget.obscureText
              ? GestureDetector(
            onTap: () {
              setState(() {
                pass = !pass;
              });
            },
            child: pass
                ? const Icon(
              Icons.visibility_off_outlined,
              color: ConstColors.kMainColor3,
            )
                : const Icon(
              Icons.visibility_outlined,
              color: ConstColors.kMainColor3,
            ),
          )
              : null,
          prefixIcon: Icon(
            widget.icon,
            color: ConstColors.kMainColor3,
          ),

          hintText: widget.hnt,
          hintStyle: ConstStyles.mainTextStyle,
          labelStyle: ConstStyles.mainTextStyle,
          // fillColor: ConstColors.kTextFieldBGColor,
          // filled: true,

          labelText: widget.hnt,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
