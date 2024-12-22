import 'package:get_it/get_it.dart';
import 'package:project2/src/onboarding/data/repos/onboarding_repo_implementation.dart';
import 'package:project2/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:project2/src/onboarding/domain/use_cases/cache_first_timer.dart';
import 'package:project2/src/onboarding/domain/use_cases/is_first_time.dart';
import 'package:project2/src/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //feature ---> OnBoarding
  // Business Logic
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerFactory(
      () => OnboardingCubit(
        cacheFirstTimer: sl(),
        isFirstTime: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => IsFirstTime(sl()))
    ..registerLazySingleton<OnboardingRepo>(
      () => OnboardingRepoImplementation(sl()),
    )
    ..registerLazySingleton(() => prefs);
}
