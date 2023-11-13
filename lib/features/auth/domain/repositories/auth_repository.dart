import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../entities/model_user.dart';


abstract class AuthRepository{


  Future<Either<Failure,ModelUser>> registerUser(ModelUser user);
  Future<Either<Failure,ModelUser>> updateUser(ModelUser user);
  Future<Either<Failure,ModelUser?>> loginUser(ModelUser user);
  Future<Either<Failure,bool>> logout();
  Future<Either<Failure,bool>> signInWithGoogle();
  Future<Either<Failure,bool>> deleteUser();
  Future<Either<Failure,bool>> forgetPass(String email);
  Future<Either<Failure,ModelUser?>> getUser(String uid);
  Future<Either<Failure,List<ModelUser>>> getAllUser();

}