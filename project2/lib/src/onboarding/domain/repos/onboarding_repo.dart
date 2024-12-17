import 'package:project2/core/utils/typedefs.dart';

abstract class OnboardingRepo {
  const OnboardingRepo();

  ResultFuture<void> cacheFirstTimer();

  ResultFuture<bool> isFirstTime();
}
