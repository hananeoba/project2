import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/src/onboarding/domain/use_cases/cache_first_timer.dart';
import 'package:project2/src/onboarding/domain/use_cases/is_first_time.dart';
import 'package:project2/src/onboarding/presentation/cubit/onboarding_cubit.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockIsFirstTime extends Mock implements IsFirstTime {}

void main() {
  late MockCacheFirstTimer cacheFirstTimer;
  late MockIsFirstTime isFirstTime;
  late OnboardingCubit onboardingCubit;

  setUp(
    () {
      cacheFirstTimer = MockCacheFirstTimer();
      isFirstTime = MockIsFirstTime();
      onboardingCubit = OnboardingCubit(
        cacheFirstTimer: cacheFirstTimer,
        isFirstTime: isFirstTime,
      );
    },
  );
  test(
    'initial state should be [onboarding initial] cubit ...',
    () async {
      expect(onboardingCubit.state, const OnBoardingInitial());
    },
  );
}
