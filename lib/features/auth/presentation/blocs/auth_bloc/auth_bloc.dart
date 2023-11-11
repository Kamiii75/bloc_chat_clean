import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/bloc_export.dart';
import '../../../../../core/utils/injections.dart';
import '../../../domain/entities/model_user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {


  AuthBloc(
      )
      : super(AuthInitial(
            isLoggedIn: false,
            isSignIn: true,
            user: ModelUser())) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AuthInitEvent>((event, emit) async {

    });
    on<ToggleView>((event, emit) {
      bool toggle = !event.isSignIn;
      emit(AuthState(
          isLoggedIn: state.isLoggedIn, isSignIn: toggle, user: state.user));
    });

    on<LoginRequested>((event, emit) async {

    });
    on<SignOutRequested>((event, emit) async {

    });
    on<DeleteRequested>((event, emit) async {

    });
    on<SignUpRequested>((event, emit) async {

    });
    on<UpdateUser>((event, emit) async {

    });
    on<AuthStatusEvent>((event, emit) {
      emit(AuthState(
          isLoggedIn: event.isLoggedIn,
          isSignIn: state.isSignIn,
          user: event.user));
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toMap();
  }
}
