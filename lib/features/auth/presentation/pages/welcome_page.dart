import 'package:flutter/material.dart';
import 'package:getx_group_chat_clean/core/constants/const_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/bloc_export.dart';
import '../widgets/bg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WelcomeBloc, WelcomeState>(
      listener: (context, state) {
        print("BlocListener");
        print(state);
        if(state.steps==2){
          context.go("/auth");
        }
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
        //  backgroundColor: Colors.white,
          body: Background(
            child: Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 23.h,
                    ),
                    Container(
                      height: 13.4.h,
                      width: 13.4.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Quip Sync',
                        style: ConstStyles.headerTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
