import 'package:flutter_test/flutter_test.dart';
import 'package:project2/src/auth/data/models/local_user_model.dart';

void main() {
  group('LocalUserModel', () {
    test('should create an instance from map', () {
      final map = {
        'uid': '123',
        'email': 'test@example.com',
        'fullName': 'Test User',
        'points': 100,
        'profilePic': 'profilePicUrl',
        'bio': 'Test bio',
        'enrolledGroupsIds': ['group1', 'group2'],
        'enrolledClassIds': ['class1', 'class2'],
        'following': ['user1', 'user2'],
        'followers': ['user3', 'user4'],
      };

      final user = LocalUserModel.fromMap(map);

      expect(user.uid, '123');
      expect(user.email, 'test@example.com');
      expect(user.fullName, 'Test User');
      expect(user.points, 100);
      expect(user.profilePic, 'profilePicUrl');
      expect(user.bio, 'Test bio');
      expect(user.enrolledGroupsIds, ['group1', 'group2']);
      expect(user.enrolledClassIds, ['class1', 'class2']);
      expect(user.following, ['user1', 'user2']);
      expect(user.followers, ['user3', 'user4']);
    });

    test('should convert an instance to map', () {
      const user = LocalUserModel(
        uid: '123',
        email: 'test@example.com',
        fullName: 'Test User',
        points: 100,
        profilePic: 'profilePicUrl',
        bio: 'Test bio',
        enrolledGroupsIds: ['group1', 'group2'],
        enrolledClassIds: ['class1', 'class2'],
        following: ['user1', 'user2'],
        followers: ['user3', 'user4'],
      );

      final map = user.toMap();

      expect(map['uid'], '123');
      expect(map['email'], 'test@example.com');
      expect(map['fullName'], 'Test User');
      expect(map['points'], 100);
      expect(map['profilePic'], 'profilePicUrl');
      expect(map['bio'], 'Test bio');
      expect(map['enrolledGroupsIds'], ['group1', 'group2']);
      expect(map['enrolledClassIds'], ['class1', 'class2']);
      expect(map['following'], ['user1', 'user2']);
      expect(map['followers'], ['user3', 'user4']);
    });

    test('should copy an instance with new values', () {
      const user = LocalUserModel(
        uid: '123',
        email: 'test@example.com',
        fullName: 'Test User',
        points: 100,
        profilePic: 'profilePicUrl',
        bio: 'Test bio',
        enrolledGroupsIds: ['group1', 'group2'],
        enrolledClassIds: ['class1', 'class2'],
        following: ['user1', 'user2'],
        followers: ['user3', 'user4'],
      );

      final updatedUser = user.copyWith(
        email: 'new@example.com',
        points: 200,
      );

      expect(updatedUser.uid, '123');
      expect(updatedUser.email, 'new@example.com');
      expect(updatedUser.fullName, 'Test User');
      expect(updatedUser.points, 200);
      expect(updatedUser.profilePic, 'profilePicUrl');
      expect(updatedUser.bio, 'Test bio');
      expect(updatedUser.enrolledGroupsIds, ['group1', 'group2']);
      expect(updatedUser.enrolledClassIds, ['class1', 'class2']);
      expect(updatedUser.following, ['user1', 'user2']);
      expect(updatedUser.followers, ['user3', 'user4']);
    });
  });
}
