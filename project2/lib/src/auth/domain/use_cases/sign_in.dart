import 'package:equatable/equatable.dart';
import 'package:project2/core/common/usecases/usecase.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/auth/domain/repos/auth_repo.dart';

class SignIn extends UseCaseWithParams<void, SignInParams> {
  SignIn(this._authRepository);

  final AuthRepo _authRepository;

  @override
  ResultFuture<void> call(SignInParams params) => _authRepository.signIn(
        email: params.email,
        password: params.password,
      );
}

class SignInParams extends Equatable {
  const SignInParams({
    required this.email,
    required this.password,
  });

  const SignInParams.empty()
      : email = '',
        password = '';

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
