part of 'welcome_bloc.dart';

class WelcomeState extends Equatable {
  final int steps;
  final List<String> welcomeImgList = [
    ConstImgSrc.welcomeOne,
    ConstImgSrc.welcomeTwo,
    ConstImgSrc.welcomeThree,
  ];
  final List<String> welcomeTitleList = [
    "Welcome",
    "Stay on Track",
    "Diverse Exercise Routines",
  ];
  final List<String> welcomeDescList = [
    "Get ready to embark on a journey to a healthier you with FitSync. We're here to help you achieve your fitness goals and stay motivated along the way.",
    "Receive reminders, workout schedules, and progress updates to keep you on track with your fitness journey.",
    "Discover a wide range of exercises in your workout plans. Keep your routine fresh and exciting",
  ];

  final PageController pageController = PageController();

  WelcomeState({required this.steps});

  @override
  List<Object> get props => [steps];

  Map<String, dynamic> toMap() {
    return {
      "steps": steps,
    };
  }

  factory WelcomeState.fromMap(Map<String, dynamic> map) {
    return WelcomeState(
      steps: 0,
    );
  }
}

class WelcomeInitial extends WelcomeState {
  WelcomeInitial({
    required super.steps,
  });
}
