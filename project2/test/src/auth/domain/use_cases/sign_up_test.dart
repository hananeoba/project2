import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/src/auth/domain/entities/user.dart';
import 'package:project2/src/auth/domain/repos/auth_repo.dart';
import 'package:project2/src/auth/domain/use_cases/sign_up.dart';

import 'mock_auth_repo.dart';

void main() {
  late SignUp signUp;
  late AuthRepo authRepo;

  setUp(() {
    authRepo = MockAuthRepo();
    signUp = SignUp(authRepo);
  });
  const tUser = LocalUser.empty();

  test('should return localUser from the  auth repo ', () async {
    when(
      () => authRepo.signUp(
        email: any(named: 'email'),
        password: any(named: 'password'),
        fullName: any(named: 'fullName'),
      ),
    ).thenAnswer((_) async => const Right(tUser));
    final result = await signUp(const SignUpParams.empty());
    expect(result, const Right<dynamic, LocalUser>(tUser));
    verify(
      () => authRepo.signUp(
        email: const SignUpParams.empty().email,
        password: const SignUpParams.empty().password,
        fullName: const SignUpParams.empty().fullName,
      ),
    ).called(1);
    verifyNoMoreInteractions(authRepo);
  });
}
