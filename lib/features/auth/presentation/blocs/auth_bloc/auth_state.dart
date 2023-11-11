part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoggedIn;
  final bool isSignIn;
  final ModelUser user;

  const AuthState(
      {required this.user, required this.isSignIn, required this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn, isSignIn, user];

  Map<String, dynamic> toMap() {
    return {
      "isLoggedIn": isLoggedIn,
      "isSignIn": isSignIn,
      "user": user,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
        isLoggedIn: map["isLoggedIn"] ?? true, //map["steps"] ?? 0,
        isSignIn: true,
        user: map["user"]);
  }
}

class AuthInitial extends AuthState {
  const AuthInitial(
      {required super.isLoggedIn,
      required super.isSignIn,
      required super.user});
}
