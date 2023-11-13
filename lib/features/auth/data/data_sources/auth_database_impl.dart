import 'package:quip_sync/features/auth/data/data_sources/auth_database_main.dart';
import 'package:quip_sync/features/auth/domain/entities/model_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDatabaseImpl implements AuthDatabaseMain {
  final SupabaseClient supabase = Supabase.instance.client;
  User? user;

  AuthDatabaseImpl() {
    user = supabase.auth.currentUser;
  }

  @override
  Future<bool> deleteUser() {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<bool> forgetPass(String email) {
    // TODO: implement forgetPass
    throw UnimplementedError();
  }

  @override
  Future<List<ModelUser>> getAllUser() {
    // TODO: implement getAllUser
    throw UnimplementedError();
  }

  @override
  Future<ModelUser?> getUser(String uid) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<ModelUser?> loginWithEmailPassword(String email, String pass) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ModelUser> signUpWithEmailPassword(ModelUser user) async {
    await supabase.auth.signUp(email:user.email,password: user.password!);
    return user;
  }

  @override
  Future<ModelUser> updateUser(ModelUser user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
