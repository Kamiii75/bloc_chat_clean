import '../../domain/entities/model_user.dart';

abstract class AuthDatabaseMain{
  Future<ModelUser> signUpWithEmailPassword(ModelUser user);
  Future<ModelUser> updateUser(ModelUser user);
  Future<ModelUser?> loginWithEmailPassword(String email,String pass);
  Future<ModelUser?> getUser(String uid);

  Future<List<ModelUser>> getAllUser();
  Future<bool> logout();
  Future<bool> forgetPass(String email);
  Future<bool> deleteUser();
}