import 'package:equatable/equatable.dart';
import 'package:project2/core/common/usecases/usecase.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/auth/domain/repos/auth_repo.dart';

class SignUp extends UseCaseWithParams<void, SignUpParams> {
  SignUp(this._authRepository);

  final AuthRepo _authRepository;
  @override
  ResultFuture<void> call(SignUpParams params) => _authRepository.signUp(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
      );
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.email,
    required this.password,
    required this.fullName,
  });

  const SignUpParams.empty()
      : email = '',
        password = '',
        fullName = '';

  final String email;
  final String password;
  final String fullName;

  @override
  List<Object?> get props => [email, password, fullName];
}
