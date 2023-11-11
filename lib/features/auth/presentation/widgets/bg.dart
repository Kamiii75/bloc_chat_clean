import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'), fit: BoxFit.cover),
      ),
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [          Positioned(
          bottom: 2.h,
          child: Container(
            height: 80.w,
            width: 80.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/main_bg.png"),
              ),
            ),
          ),
        ),
          Positioned(
            height: 60.h,
            width: 100.w,
            bottom: -5.h,
            child: Image.asset('assets/images/splashpath.png'),
          ),

          child,
        ],
      ),
    );
  }
}