import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/src/onboarding/data/datasource/onboarding_local_datasrc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences prefs;
  late OnboardingLocalDataSrcImpl localDatasrcImpl;

  setUp(() {
    prefs = MockSharedPreferences();
    localDatasrcImpl = OnboardingLocalDataSrcImpl(prefs);
  });

  group('cacheFirstTimer to cache the data', () {
    test('should call [SharedPreferences]', () async {
      when(() => prefs.setBool(any(), any())).thenAnswer((_) async => true);

      await localDatasrcImpl.cacheFirstTimer();

      verify(() => prefs.setBool(any(), any())).called(1);
    });
  });
}
