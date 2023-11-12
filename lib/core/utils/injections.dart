import 'package:get_it/get_it.dart';
import 'package:quip_sync/features/auth/data/data_sources/auth_database_impl.dart';
import 'package:quip_sync/features/auth/data/data_sources/auth_database_main.dart';
import '../../features/auth/data/repositories/auth_repository_implementation.dart';
import '../../features/auth/domain/entities/model_user.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/use_cases/auth_use_cases.dart';
import 'bloc_export.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Blocs
  sl.registerLazySingleton<WelcomeBloc>(() => WelcomeBloc());

  sl.registerLazySingleton<AuthBloc>(() => AuthBloc(
      updateUserUseCase: sl(),
      registerUserUseCase: sl(),
      loginUserUseCase: sl(),
      logoutUseCase: sl(),
      getAllUserUseCase: sl(),
      getUserUseCase: sl(),
      forgetUseCase: sl(),
      deleteUseCase: sl()));

  // //! Bloc States

  sl.registerLazySingleton<AuthState>(
      () => AuthState(user: ModelUser(), isSignIn: false, isLoggedIn: false));

  // //! USE CASES

  sl.registerLazySingleton(() => ForgetUseCase(repository: sl()));
  sl.registerLazySingleton(() => UpdateUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => RegisterUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => LogoutUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => DeleteUseCase(repository: sl()));

  // //! REPOSITORIES
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDatabase: sl()),
  );

  // //! DATA SOURCES

  sl.registerLazySingleton<AuthDatabaseMain>(
    () => AuthDatabaseImpl(),
  );

  // //! CORE

  // //! EXTERNAL

  // //! Initial Functions

  sl<WelcomeBloc>().add(WelcomeInitEvent());

  sl<AuthBloc>().add(AuthInitEvent());
}
