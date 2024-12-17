import 'package:project2/core/common/usecases/usecase.dart';
import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/onboarding/domain/repos/onboarding_repo.dart';

class IsFirstTime extends UseCaseWithoutParams<bool> {
  const IsFirstTime(this._repo);

  final OnboardingRepo _repo;

  @override
  ResultFuture<bool> call() async => _repo.isFirstTime();
}
