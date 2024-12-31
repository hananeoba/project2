import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/core/errors/failure.dart';
import 'package:project2/src/auth/domain/repos/auth_repo.dart';
import 'package:project2/src/auth/domain/use_cases/forgot_password.dart';

import 'mock_auth_repo.dart';

void main() {
  late AuthRepo authRepo;
  late ForgotPassword forgetPassword;

  setUp(() {
    authRepo = MockAuthRepo();
    forgetPassword = ForgotPassword(authRepo);
  });
  test('should call AuthRepo and comeplete successfully', () async {
    when(() => authRepo.forgotPassword('email')).thenAnswer(
      (_) async => Left<ServerFailure, void>(
        ServerFailure(message: 'error', statusCode: 500),
      ),
    );
    final result = await forgetPassword('email');
    expect(
      result,
      Left<ServerFailure, void>(
        ServerFailure(message: 'error', statusCode: 500),
      ),
    );
    verify(() => authRepo.forgotPassword('email')).called(1);
    verifyNoMoreInteractions(authRepo);
  });
}
