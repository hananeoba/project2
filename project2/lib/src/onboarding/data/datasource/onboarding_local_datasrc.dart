import 'package:project2/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDatasrc {
  const OnboardingLocalDatasrc();

  Future<void> cacheFirstTimer();

  Future<bool> isFirstTime();
}

const kFirstTimerKey = 'first_timer';

class OnboardingLocalDataSrcImpl extends OnboardingLocalDatasrc {
  const OnboardingLocalDataSrcImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await _prefs.setBool(kFirstTimerKey, false);
    } catch (e) {
      throw CacheExceptions(message: e.toString());
    }
  }

  @override
  Future<bool> isFirstTime() async {
    try {
      return _prefs.getBool(kFirstTimerKey) ?? true;
    } on Exception catch (e) {
      throw CacheExceptions(message: e.toString());
    }
  }
}
