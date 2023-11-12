import 'package:dartz/dartz.dart';
import 'package:quip_sync/features/auth/data/data_sources/auth_database_main.dart';
import '../../../../core/utils/failure.dart';
import '../../domain/entities/model_user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatabaseMain remoteDatabase;

  AuthRepositoryImpl({required this.remoteDatabase});

  @override
  Future<Either<Failure, ModelUser>> registerUser(ModelUser user) async {
    try {
      final result = await remoteDatabase.signUpWithEmailPassword(user);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }  @override
  Future<Either<Failure, ModelUser>> updateUser(ModelUser user) async {
    try {
      final result = await remoteDatabase.updateUser(user);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }



  @override
  Future<Either<Failure, ModelUser?>> loginUser(ModelUser user) async {
    try {
      final result = await remoteDatabase.loginWithEmailPassword(user.email!,user.password!);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
     var results= await remoteDatabase.logout();

      return  Right(results);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }


  @override
  Future<Either<Failure, ModelUser?>> getUser(String uid) async {
    try {
      final result = await remoteDatabase.getUser(uid);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ModelUser>>> getAllUser() async {
    try {
      final result = await remoteDatabase.getAllUser();

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> forgetPass(String email) async {
    try {
      final result = await remoteDatabase.forgetPass( email);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteUser() async {
    try {
      var results= await remoteDatabase.deleteUser();

      return  Right(results);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }


}
