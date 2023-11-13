import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/model_user.dart';
import '../repositories/auth_repository.dart';


class SigninGoogleUserUseCase implements UseCase<bool?, NoParams> {
  final AuthRepository repository;

  SigninGoogleUserUseCase({required this.repository});

  @override
  Future<Either<Failure, bool?>> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}
