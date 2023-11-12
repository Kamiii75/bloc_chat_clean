import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/model_user.dart';
import '../repositories/auth_repository.dart';


class GetUserUseCase implements UseCase<ModelUser?, Params<String>> {
  final AuthRepository repository;

  GetUserUseCase({required this.repository});

  @override
  Future<Either<Failure, ModelUser?>> call(Params params) async {
    return await repository.getUser(params.data);
  }
}
