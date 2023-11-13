import 'package:flutter/foundation.dart';
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
  Future<ModelUser?> loginWithEmailPassword(String email, String pass) async {
    await supabase.auth.signInWithPassword(email: email, password: pass);
    ModelUser user = ModelUser(email: email, password: pass);
    return user;
  }

  @override
  Future<bool> logout() async {
    await supabase.auth.signOut();

    return true;
  }

  @override
  Future<ModelUser> signUpWithEmailPassword(ModelUser user) async {
    await supabase.auth.signUp(email: user.email, password: user.password!);
    return user;
  }

  @override
  Future<ModelUser> updateUser(ModelUser user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithGoogle() async {
    await supabase.auth.signInWithOAuth(Provider.google,
        redirectTo: kIsWeb ? null : "io.supabase.chat_clean://login-callback");
    return true;
  }
}
