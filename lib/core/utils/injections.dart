import 'package:get_it/get_it.dart';
import 'bloc_export.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Blocs
  sl.registerLazySingleton<WelcomeBloc>(() => WelcomeBloc());


  sl.registerLazySingleton<AuthBloc>(() => AuthBloc());
  //
  // //! Bloc States
  // sl.registerLazySingleton<StylesState>(() => StylesState(
  //     selectedPlan: ModelPlan(),
  //     selectedStyle: ModelStyles(),
  //     allStyles: const [],
  //     allPlans: const [],
  //     selectedGoal: ModelGoals(),
  //     allGoals: const []));
  // sl.registerLazySingleton<WorkoutState>(() => WorkoutState(
  //     selectedExercises: const [],
  //     allWorkout: const [],
  //     allExercises: const [],
  //     exeIndex: -1,
  //     selectedExercise: ModelExercise(),
  //     selectedWorkout: ModelWorkout()));
  // sl.registerLazySingleton<StartWorkoutState>(() => StartWorkoutState(
  //     selectedExercises: const [],
  //     exeIndex: -1,
  //     selectedExercise: ModelExercise(),
  //     myWorkout: const [],
  //     myExercises: const [],
  //     selectedWorkout: ModelWorkout(),
  //     duration: const Duration(seconds: 0),
  //     isStart: false));
  // sl.registerLazySingleton<AuthState>(
  //     () => AuthState(user: ModelUser(), isSignIn: false, isLoggedIn: false));
  // sl.registerLazySingleton<ExerciseState>(() => const ExerciseState(
  //     allExercises: [],
  //     chestExercises: [],
  //     legExercises: [],
  //     bicepsExercises: [],
  //     tricepsExercises: [],
  //     backExercises: [],
  //     shoulderExercises: []));
  //
  // //! USE CASES
  // ///
  // sl.registerLazySingleton(() => ForgetUseCase(repository: sl()));
  // sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl()));
  // sl.registerLazySingleton(() => RegisterUserUseCase(repository: sl()));
  // sl.registerLazySingleton(() => LoginUserUseCase(repository: sl()));
  // sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetUserUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetAllUserUseCase(repository: sl()));
  // sl.registerLazySingleton(() => DeleteUseCase(repository: sl()));
  //
  // ///
  // sl.registerLazySingleton(() => GetAllStylesUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetAllPlansUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetAllGoalsUseCase(repository: sl()));
  //
  // ///
  // sl.registerLazySingleton(() => GetAllWorkoutsUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetAllExercisesUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetMyWorkoutsUseCase(repository: sl()));
  // sl.registerLazySingleton(() => GetMyExercisesUseCase(repository: sl()));
  //
  // //! REPOSITORIES
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(remoteDatabase: sl()),
  // );
  // sl.registerLazySingleton<SettingsRepository>(
  //   () => SettingsRepositoryImpl(remoteDatabase: sl()),
  // );
  // sl.registerLazySingleton<WorkoutRepository>(
  //   () => WorkoutRepositoryImpl(remoteDatabase: sl()),
  // );
  //
  // //! DATA SOURCES
  // sl.registerLazySingleton<MainDatabase>(
  //   () => DatabaseImpl(),
  // );
  // sl.registerLazySingleton<SettingsDatabase>(
  //   () => DatabaseSettingsImpl(),
  // );
  // sl.registerLazySingleton<WorkoutDatabase>(
  //   () => DatabaseWorkoutImpl(),
  // );
  // sl.registerLazySingleton<MainAuth>(
  //   () => AuthImpl(),
  // );
  //
  // //! CORE
  //
  // //! EXTERNAL
  // // sl.registerLazySingleton(() => Dio());
  // // final sharedPref = await SharedPreferences.getInstance();
  // // sl.registerLazySingleton(() => sharedPref);
  //
  // //! Initial Functions

  sl<WelcomeBloc>().add(WelcomeInitEvent());
  // sl<StylesBloc>().add(GetAllStyles());
  sl<AuthBloc>().add(AuthInitEvent());
  // sl<WorkoutBloc>().add(GetAllWorkout());
  // sl<WorkoutBloc>().add(GetAllExercises());
  // sl<ExerciseBloc>().add(GetAllExercisesForType());
}
