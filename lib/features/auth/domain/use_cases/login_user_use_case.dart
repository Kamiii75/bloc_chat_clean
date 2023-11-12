import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/model_user.dart';
import '../repositories/auth_repository.dart';


class LoginUserUseCase implements UseCase<ModelUser?, Params<ModelUser>> {
  final AuthRepository repository;

  LoginUserUseCase({required this.repository});

  @override
  Future<Either<Failure, ModelUser?>> call(Params params) async {
    return await repository.loginUser(params.data);
  }
}
