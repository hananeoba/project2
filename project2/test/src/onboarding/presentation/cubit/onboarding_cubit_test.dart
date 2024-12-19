import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/core/errors/failure.dart';
import 'package:project2/src/onboarding/domain/use_cases/cache_first_timer.dart';
import 'package:project2/src/onboarding/domain/use_cases/is_first_time.dart';
import 'package:project2/src/onboarding/presentation/cubit/onboarding_cubit.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockIsFirstTime extends Mock implements IsFirstTime {}

void main() {
  late MockCacheFirstTimer cacheFirstTimer;
  late MockIsFirstTime isFirstTime;
  late OnboardingCubit cubit;

  setUp(
    () {
      cacheFirstTimer = MockCacheFirstTimer();
      isFirstTime = MockIsFirstTime();
      cubit = OnboardingCubit(
        cacheFirstTimer: cacheFirstTimer,
        isFirstTime: isFirstTime,
      );
    },
  );
  test(
    'initial state should be [onboarding initial] cubit ...',
    () async {
      expect(cubit.state, const OnBoardingInitial());
    },
  );

  group('cache first timer ', () {
    blocTest<OnboardingCubit, OnboardingState>(
      'emits [MyState] when MyEvent is added.',
      build: () {
        when(() => cacheFirstTimer()).thenAnswer(
          (_) async => const Right(null),
        );
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () => const [
        CachingFirstTimer(),
        UserCached(),
      ],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );
    blocTest<OnboardingCubit, OnboardingState>(
      'emits [CachingFirstTimer, onboardingError] when unsuccessful',
      build: () {
        when(() => cacheFirstTimer()).thenAnswer(
          (_) async =>
              Left(CacheFailure(message: 'could not cache', statusCode: 4032)),
        );
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () => const [
        CachingFirstTimer(),
        OnboardingError(message: 'could not cache'),
      ],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );
  });
  group('isfirstTime ', () {
    blocTest<OnboardingCubit, OnboardingState>(
      'emits [checkingIsFirstTime, onBoardingSatus] when MyEvent is added.',
      build: () {
        when(() => isFirstTime()).thenAnswer(
          (_) async => const Right(true),
        );
        return cubit;
      },
      act: (cubit) => cubit.isFirstTime(),
      expect: () => const [
        CheckingIsFirstTimer(),
        OnBoardingStatus(isFirstTime: true),
      ],
      verify: (_) {
        verify(() => isFirstTime()).called(1);
        verifyNoMoreInteractions(isFirstTime);
      },
    );
    blocTest<OnboardingCubit, OnboardingState>(
      'emits [checkingFirstTimer, onboardingError] when unsuccessful',
      build: () {
        when(() => cacheFirstTimer()).thenAnswer(
          (_) async => Left(
            CacheFailure(message: 'could not retreive cache', statusCode: 404),
          ),
        );
        return cubit;
      },
      act: (cubit) => cubit.isFirstTime(),
      expect: () => const [
        CheckingIsFirstTimer(),
        OnBoardingStatus(isFirstTime: true),
      ],
      verify: (_) {
        verify(() => isFirstTime()).called(1);
        verifyNoMoreInteractions(isFirstTime);
      },
    );
  });
}
