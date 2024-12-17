import 'package:project2/core/common/usecases/usecase.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/onboarding/domain/repos/onboarding_repo.dart';

class CacheFirstTimer extends UseCaseWithoutParams<void> {
  const CacheFirstTimer(this._repo);

  final OnboardingRepo _repo;

  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}
