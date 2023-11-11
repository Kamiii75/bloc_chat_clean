import 'package:flutter/material.dart';
import 'package:quip_sync/features/auth/presentation/pages/signup_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:quip_sync/features/auth/presentation/pages/signin_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/bloc_export.dart';
import '../widgets/bg.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoggedIn) {
          context.go("/home");
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            return state.isSignIn;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Background(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.png'), fit: BoxFit.cover),
                ),
                width: double.infinity,
                height: 100.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        'assets/images/login_header.png',
                        width: 100.w,
                      ),
                    ),
                    Positioned(
                      bottom: -5.h,
                      child: Image.asset(
                        'assets/images/login_footer.png',
                        width: 100.w,
                      ),
                    ),
                    Positioned(
                      bottom:1.h,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        width: 50.w,
                        height: 50.w,
                        child: Opacity(
                          opacity: .2,
                          child: Image.asset('assets/images/main_bg.png',
                            ),
                        ),
                      ),
                    ),
                   state.isSignIn ? const SignInScreen() : const SignUpScreen(),
                  ],
                ),
              )



              ,
            ),
          ),
        );
      }),
    );
    // TODO: implement listener
  }
}
