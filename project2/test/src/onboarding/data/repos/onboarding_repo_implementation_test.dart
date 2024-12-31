import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/core/errors/exceptions.dart';
import 'package:project2/core/errors/failure.dart';
import 'package:project2/src/onboarding/data/datasource/onboarding_local_datasrc.dart';
import 'package:project2/src/onboarding/data/repos/onboarding_repo_implementation.dart';
import 'package:project2/src/onboarding/domain/repos/onboarding_repo.dart';

class MockOnboardingLocalDataSrc extends Mock
    implements OnboardingLocalDatasrc {}

void main() {
  late OnboardingLocalDatasrc localDataSrc;
  late OnboardingRepoImplementation repoImpl;

  setUp(() {
    localDataSrc = MockOnboardingLocalDataSrc();
    repoImpl = OnboardingRepoImplementation(localDataSrc);
  });

  test('check if it is a subclass of [onboardingRepo]', () {
    expect(repoImpl, isA<OnboardingRepo>());
  });
  group('cacheFirstTimer ', () {
    test('should complete successfully', () async {
      when(() => localDataSrc.cacheFirstTimer())
          .thenAnswer((_) async => Future.value());

      final result = await repoImpl.cacheFirstTimer();
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(() => localDataSrc.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSrc);
    });
    test('should return failure if call is unsuccessfully  ', () async {
      when(() => localDataSrc.cacheFirstTimer()).thenThrow(
        const CacheExceptions(
          message: 'unsufficient storage ',
        ),
      );

      final result = await repoImpl.cacheFirstTimer();
      expect(
        result,
        equals(
          Left<CacheFailure, dynamic>(
            CacheFailure(
              message: 'unsufficient storage ',
              statusCode: 500,
            ),
          ),
        ),
      );
      verify(() => localDataSrc.cacheFirstTimer()).called(1);
      verifyNoMoreInteractions(localDataSrc);
    });
  });
}
