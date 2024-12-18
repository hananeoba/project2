import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDatasrc {
  const OnboardingLocalDatasrc();

  Future<void> cacheFirstTimer();
  Future<bool> isFirstTime();
}

class OnboardingLocalDataSrcImpl extends OnboardingLocalDatasrc {
  const OnboardingLocalDataSrcImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheFirstTimer() async {
    return Future.value();
  }

  @override
  Future<bool> isFirstTime() async {
    return Future.value(true);
  }
}
