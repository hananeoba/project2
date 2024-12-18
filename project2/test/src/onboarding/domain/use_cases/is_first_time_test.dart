import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/core/errors/failure.dart';
import 'package:project2/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:project2/src/onboarding/domain/use_cases/is_first_time.dart';

import 'on_boarding_repo_mock.dart';

void main() {
  late OnboardingRepo repo;
  late IsFirstTime usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = IsFirstTime(repo);
  });

  test(
      'should call the [Onboardingrepo.cacheFirstTimer]'
      ' and return the right data', () async {
    // arrange
    when(() => repo.isFirstTime()).thenAnswer(
      (_) async => Left(
        ServerFailure(
          message: 'unknown error',
          statusCode: 500,
        ),
      ),
    );
    // act
    final result = await usecase();
    // assert
    expect(
      result,
      Left<Failure, dynamic>(
        ServerFailure(message: 'unknown error', statusCode: 500),
      ),
    );
    verify(() => repo.isFirstTime()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
