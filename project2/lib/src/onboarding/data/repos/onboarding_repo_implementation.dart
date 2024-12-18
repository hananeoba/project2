import 'package:dartz/dartz.dart';
import 'package:project2/core/errors/exceptions.dart';
import 'package:project2/core/errors/failure.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/onboarding/data/datasource/onboarding_local_datasrc.dart';
import 'package:project2/src/onboarding/domain/repos/onboarding_repo.dart';
import 'package:project2/src/onboarding/domain/use_cases/is_first_time.dart';

class OnboardingRepoImplementation implements OnboardingRepo {
  const OnboardingRepoImplementation(this._localDataSource);

  final OnboardingLocalDatasrc _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      return const Right(null);
    } on CacheExceptions catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> isFirstTime() async {
    try {
      await _localDataSource.isFirstTime();
      return const Right(true);
    } on CacheExceptions catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
