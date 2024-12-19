part of 'onboarding_cubit.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

final class OnBoardingInitial extends OnboardingState {
  const OnBoardingInitial();
}

class CachingFirstTimer extends OnboardingState {
  const CachingFirstTimer();
}

class CheckingIsFirstTimer extends OnboardingState {
  const CheckingIsFirstTimer();
}

class UserCached extends OnboardingState {
  const UserCached();
}

class OnBoardingStatus extends OnboardingState {
  const OnBoardingStatus({required this.isFirstTime});

  final bool isFirstTime;

  @override
  List<bool> get props => [isFirstTime];
}

class OnboardingError extends OnboardingState {
  const OnboardingError({required this.message});

  final String message;

  @override
  List<String> get props => [message];
}
