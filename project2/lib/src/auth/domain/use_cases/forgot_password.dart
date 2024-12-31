import 'package:project2/core/common/usecases/usecase.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends UseCaseWithParams<void, String> {
  ForgotPassword(this._authRepository);

  final AuthRepo _authRepository;
  @override
  ResultFuture<void> call(String params) =>
      _authRepository.forgotPassword(params);
}
