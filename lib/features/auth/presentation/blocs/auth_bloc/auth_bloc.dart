import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../core/utils/bloc_export.dart';
import '../../../../../core/utils/use_case.dart';
import '../../../domain/entities/model_user.dart';
import '../../../domain/use_cases/auth_use_cases.dart';
import '../../widgets/components.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final UpdateUserUseCase updateUserUseCase;
  final RegisterUserUseCase registerUserUseCase;
  final LoginUserUseCase loginUserUseCase;
  final LogoutUseCase logoutUseCase;
  final GetAllUserUseCase getAllUserUseCase;
  final GetUserUseCase getUserUseCase;
  final ForgetUseCase forgetUseCase;
  final DeleteUseCase deleteUseCase;

  AuthBloc(
      {required this.updateUserUseCase,
    required  this.registerUserUseCase,
    required  this.loginUserUseCase,
    required  this.logoutUseCase,
    required  this.getAllUserUseCase,
    required  this.getUserUseCase,
    required  this.forgetUseCase,
    required  this.deleteUseCase})
      : super(
            AuthInitial(isLoggedIn: false, isSignIn: true, user: ModelUser())) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ToggleView>((event, emit) {
      bool toggle = !event.isSignIn;
      emit(AuthState(
          isLoggedIn: state.isLoggedIn, isSignIn: toggle, user: state.user));
    });

    on<AuthInitEvent>((event, emit) async {
      if (Supabase.instance.client.auth.currentUser != null) {
        var results = await getUserUseCase(
            Params(Supabase.instance.client.auth.currentUser!.id));

        results.fold((failure) => EasyLoading.showError('Something went wrong'),
            (value) {
          if (value != null) {
            add(AuthStatusEvent(isLoggedIn: true, user: value));
          } else {
            EasyLoading.showError('Something went wrong');
          }
        });
      }
      EasyLoading.dismiss();
    });
    on<LoginRequested>((event, emit) async {

      EasyLoading.show(status: 'Signing In...');
      ModelUser user = ModelUser(email: event.email, password: event.password);
      var results = await loginUserUseCase(Params(user));

      results.fold((failure) => EasyLoading.showError('Something went wrong : Failure'),
              (value) {
            if (value != null) {
              add(AuthStatusEvent(isLoggedIn: true, user: value));
              EasyLoading.showSuccess('SignIn Success!');
            } else {

              EasyLoading.showError('Something went wrong');
            }
          });
      EasyLoading.dismiss();
    });
    on<SignOutRequested>((event, emit) async {});
    on<DeleteRequested>((event, emit) async {});
    on<SignUpRequested>((event, emit) async {
      EasyLoading.show(status: 'Signing Up...');
      var results = await registerUserUseCase(Params(event.user));

      results.fold((failure) => EasyLoading.showError('Something went wrong'),
              (value) {
            if (value !=null) {
              add(AuthStatusEvent(isLoggedIn: true, user: value!));

              signUpNameController.clear();
              signUpPasswordController.clear();
              signUpEmailController.clear();
              EasyLoading.showSuccess('SignUp Success!');
            } else {
              EasyLoading.showError('Something went wrong');
              // CustomSnakeBars.snakeBanner(
              //     context, 'Failed', 'This Email is already register. Please try another one', 'failure');
            }
          });

      EasyLoading.dismiss();});
    on<UpdateUser>((event, emit) async {});
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
