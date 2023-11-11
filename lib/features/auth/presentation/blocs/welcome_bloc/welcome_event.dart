part of 'welcome_bloc.dart';

abstract class WelcomeEvent extends Equatable {
  const WelcomeEvent();

  @override
  List<Object> get props => [];
}

class WelcomeInitEvent extends WelcomeEvent {}


class WelcomeChangeStepEvent extends WelcomeEvent {
  final int steps;

  const WelcomeChangeStepEvent({required this.steps});

  @override
  List<Object> get props => [steps];
}class ChangeStepEvent extends WelcomeEvent {
  final int steps;

  const ChangeStepEvent({required this.steps});

  @override
  List<Object> get props => [steps];
}


