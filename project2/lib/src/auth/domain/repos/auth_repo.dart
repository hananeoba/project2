import 'package:project2/core/enums/update_user.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });
  ResultFuture<LocalUser> signUp({
    required String email,
    required String password,
    required String fullName,
  });

  ResultFuture<void> updateUserData({
    required updateUserAction action,
    dynamic userData,
  });
}
