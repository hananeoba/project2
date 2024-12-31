import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project2/core/enums/update_user.dart';
import 'package:project2/src/auth/domain/entities/user.dart';
import 'package:project2/src/auth/domain/repos/auth_repo.dart';
import 'package:project2/src/auth/domain/use_cases/update_user.dart';

import 'mock_auth_repo.dart';

void main() {
  late UpdateUser updateUser;
  late AuthRepo authRepo;

  setUp(() {
    authRepo = MockAuthRepo();
    updateUser = UpdateUser(authRepo);
  });
  const tUser = LocalUser.empty();

  test('should return localUser from the  auth repo ', () async {
    when(
      () => authRepo.updateUserData(
        action: updateUserAction.fullName,
        userData: UpdateUserParams.empty().userData,
      ),
    ).thenAnswer((_) async => const Right(tUser));
    final result = await updateUser(UpdateUserParams.empty());
    expect(result, const Right<dynamic, LocalUser>(tUser));
    verify(
      () => authRepo.updateUserData(
        action: UpdateUserParams.empty().action,
        userData: UpdateUserParams.empty().userData,
      ),
    ).called(1);
    verifyNoMoreInteractions(authRepo);
  });
}
