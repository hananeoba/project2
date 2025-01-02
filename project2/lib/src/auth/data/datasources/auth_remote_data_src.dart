import 'package:project2/core/enums/update_user.dart';
import 'package:project2/src/auth/data/models/local_user_model.dart';

abstract class AuthRemoteDataSrc {
  const AuthRemoteDataSrc();

  Future<LocalUserModel> signIn({
    required String email,
    required String password,
  });
  Future<void> updateUser({
    required updateUserAction action,
    dynamic data,
  });
  Future<LocalUserModel> signUp({
    required String email,
    required String fullName,
    required String password,
  });
  Future<void> forgetPassword(String email);
}
