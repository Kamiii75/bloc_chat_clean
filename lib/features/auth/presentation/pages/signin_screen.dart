import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quip_sync/core/constants/const_colors.dart';
import 'package:quip_sync/core/constants/const_styles.dart';
import 'package:quip_sync/core/widgets/default_buttons.dart';
import 'package:quip_sync/features/auth/presentation/widgets/components.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/bloc_export.dart';
import '../../../../core/utils/injections.dart';
import '../../../../core/widgets/default_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
          key: signInFormKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                    child: Center(
                      child: Container(
                        height: 13.4.h,
                        width: 13.4.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Login',
                      style: ConstStyles.headerTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultTextField(
                    hnt: 'Email',
                    controller: signInEmailController,
                    icon: Icons.alternate_email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  DefaultTextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: signInPasswordController,
                    hnt: "Password",
                    obscureText: true,
                    icon: Icons.security,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  const DefaultButton(
                    onPressed: signInFunc,
                    txt: 'Login',
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Center(
                    child: SizedBox(
                      width: 75.w,
                      child: Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: ConstColors.kMainColor1,
                            thickness: 5.sp,
                          )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.sp),
                            child: Text(
                              'OR',
                              style: ConstStyles.headerTextStyle
                                  .copyWith(fontSize: 20.sp),
                            ),
                          ),
                          Expanded(
                              child: Divider(
                            color: ConstColors.kMainColor1,
                            thickness: 5.sp,
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  GestureDetector(
                    onTap: () => sl<AuthBloc>()
                        .add(SigninGoogleRequested(context: context)),
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      size: 30.sp,
                      color: ConstColors.kMainColor3,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => ForgetPassword(),
                        //     ));
                      },
                      child: Text(
                        "Forget Password?",
                        style: ConstStyles.mainTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: ConstStyles.mainTextStyle,
                        ),
                        GestureDetector(
                          onTap: () => sl<AuthBloc>()
                              .add(ToggleView(isSignIn: state.isSignIn)),
                          child: Text(
                            "Register",
                            style: ConstStyles.mainTextStyle.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
