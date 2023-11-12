import 'package:dartz/dartz.dart';
import '../../../../core/utils/failure.dart';
import '../../../../core/utils/use_case.dart';
import '../repositories/auth_repository.dart';


class DeleteUseCase implements UseCase<bool, NoParams> {
  final AuthRepository repository;

  DeleteUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.deleteUser();
  }
}
