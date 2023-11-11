part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitEvent extends AuthEvent {}

class ToggleView extends AuthEvent {
  final bool isSignIn;

  const ToggleView({required this.isSignIn});

  @override
  List<Object> get props => [isSignIn];
}

class SignOutRequested extends AuthEvent {
  final BuildContext context;

  const SignOutRequested({required this.context});
}

class DeleteRequested extends AuthEvent {
  final String email;
  final String password;

  final BuildContext context;

  const DeleteRequested(
      {required this.context, required this.email, required this.password});
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});
}

class SignUpRequested extends AuthEvent {
  final ModelUser user;

  const SignUpRequested({required this.user});
}

class UpdateUser extends AuthEvent {
  final ModelUser user;

  const UpdateUser({required this.user});
}

class GetUser extends AuthEvent {
  final ModelUser user;

  const GetUser({required this.user});
}

class AuthStatusEvent extends AuthEvent {
  final bool isLoggedIn;
  final ModelUser user;

  const AuthStatusEvent({required this.user, required this.isLoggedIn});

  @override
  List<Object> get props => [isLoggedIn, user];
}
