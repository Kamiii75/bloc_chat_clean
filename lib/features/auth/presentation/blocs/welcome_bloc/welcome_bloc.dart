import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../../../../core/constants/const_img_src.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends HydratedBloc<WelcomeEvent, WelcomeState> {
  Timer? _timer;

  WelcomeBloc() : super(WelcomeInitial(steps: 0)) {
    on<WelcomeEvent>((event, emit) {
      //emit(WelcomeState(isLoggedIn: state.isLoggedIn, steps: state.steps));
    });

    on<WelcomeInitEvent>((event, emit) {
      startTimer(state);
    });
    on<WelcomeChangeStepEvent>((event, emit) async {
      if (state.steps < (state.welcomeImgList.length - 1)) {
        if (state.steps == (state.welcomeImgList.length - 2)) {
          _timer?.cancel();
        }
        int stp = state.steps + 1;
        // state.pageController.nextPage(
        //   duration: const Duration(milliseconds: 500),
        //   curve: Curves.fastEaseInToSlowEaseOut,
        // );
        emit(WelcomeState(steps: stp));
      } else {
        _timer?.cancel();
      }
    });
    on<ChangeStepEvent>((event, emit) async {
      emit(WelcomeState(steps: event.steps));
    });
  }

  @override
  WelcomeState? fromJson(Map<String, dynamic> json) {
    return WelcomeState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(WelcomeState state) {
    return state.toMap();
  }

  void startTimer(WelcomeState state) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      add(WelcomeChangeStepEvent(steps: state.steps));
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
