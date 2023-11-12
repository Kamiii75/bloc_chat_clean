import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_case.dart';
import '../entities/model_user.dart';
import '../repositories/auth_repository.dart';


class GetAllUserUseCase implements UseCase<List<ModelUser>, NoParams> {
  final AuthRepository repository;

  GetAllUserUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ModelUser>>> call(NoParams params) async {
    return await repository.getAllUser();
  }
}
