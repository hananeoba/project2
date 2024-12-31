import 'package:project2/core/common/usecases/usecase.dart';
import 'package:project2/core/enums/update_user.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/auth/domain/repos/auth_repo.dart';

class UpdateUser extends UseCaseWithParams<void, UpdateUserParams> {
  UpdateUser(this._authRepository);

  final AuthRepo _authRepository;
  @override
  ResultFuture<void> call(UpdateUserParams params) => _authRepository
      .updateUserData(action: params.action, userData: params.userData);
}

class UpdateUserParams {
  const UpdateUserParams({
    required this.action,
    required this.userData,
  });

  UpdateUserParams.empty()
      : action = updateUserAction.fullName,
        userData = {};

  final updateUserAction action;
  final Map<String, dynamic> userData;
}
