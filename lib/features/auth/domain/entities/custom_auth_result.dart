import 'model_user.dart';

class CustomAuthResult {
  bool status;
  String? errorMessage;
  ModelUser user;

  CustomAuthResult(
      {this.status = false, this.errorMessage, required this.user});
}
