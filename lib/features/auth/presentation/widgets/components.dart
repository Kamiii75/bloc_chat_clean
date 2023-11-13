
import 'package:flutter/material.dart';

import '../../../../core/utils/injections.dart';
import '../../domain/entities/model_user.dart';
import '../blocs/auth_bloc/auth_bloc.dart';


TextEditingController signUpNameController = TextEditingController();
TextEditingController signUpEmailController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();


TextEditingController forgotPassEmailController = TextEditingController();
TextEditingController signInEmailController = TextEditingController();
TextEditingController signInPasswordController = TextEditingController();



String? validateNameField(String? text) {
  if (text == null || text.isEmpty) {
    return 'Name is empty';
  }
  return null;
}

String? validateEmailField(String? text) {
  String pattern =
      r"^[a-zA-Z0-9_.]+@(gmail|yahoo|outlook|apple|hotmail|mailbox|aim).com$";
  RegExp regex = RegExp(pattern);

  if (text!.isEmpty) {
    return "Email is empty";
  } else if (!regex.hasMatch(text)) {
    return 'Enter a Valid Email Address ';
  }
  return null;
}

String? validatePasswordField(String? text) {
  if (text == null || text.isEmpty) {
    return 'Password is empty';
  } else if (text.length < 6) {
    return 'Password must be more then 5 alphabets';
  }
  return null;
}

String? validateConfirmPasswordField(String? text) {
  if (text == null || text.isEmpty) {
    return 'Confirm Password is empty';
  } else if (text != signUpPasswordController.text) {
    return 'Password is not matched';
  }
  return null;
}

String? validateContactField(String? text) {
  if (text == null || text.isEmpty) {
    return 'Contact is empty';
  } else if (!text.contains('03')) {
    return 'Contact should contain 03';
  } else if (text.length < 11) {
    return 'Contact must be 11 digits';
  }
  return null;
}

final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();


signUpFunc() {
  ModelUser user = ModelUser(
      isAdmin: false,
      status: 0,
      imgUrl: '',
      name: signUpNameController.text,
      phone: "",
      email: signUpEmailController.text,
      password: signUpPasswordController.text);

  bool isAdded = false;
  // for (var element in allUsers) {
  //   if (user.phone == element.phone) {
  //     isAdded = true;
  //   }
  // }

  if (!isAdded) {
    if (signUpFormKey.currentState!.validate()) {
      sl<AuthBloc>().add(SignUpRequested(user: user));
    } else {
      // CustomSnakeBars.snakeBanner(
      //     context, 'Failed', 'User Credentials are Invalid', 'failure');
    }
  } else {
    // CustomSnakeBars.snakeBanner(
    //     context, 'Failed', 'Phone Number already Exists', 'failure');
  }
}
signInFunc() {
  if (signInFormKey.currentState!.validate()) {
    sl<AuthBloc>().add(LoginRequested(
        email: signInEmailController.text.trim(),
        password: signInPasswordController.text.trim()));
  } else {
    // CustomSnakeBars.snakeBanner(
    //     context, 'Failed', 'User Credentials are Invalid', 'failure');
  }
}