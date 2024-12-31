// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.points,
    this.enrolledGroupsIds = const [],
    this.enrolledClassIds = const [],
    this.followers = const [],
    this.following = const [],
    this.profilePic,
    this.bio,
  });

  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          fullName: '',
          points: 0,
          enrolledGroupsIds: const [],
          followers: const [],
          following: const [],
          bio: '',
          profilePic: '',
          enrolledClassIds: const [],
        );

  final String uid;
  final String email;
  final String fullName;
  final int points;
  final String? profilePic;
  final String? bio;
  final List<String> enrolledGroupsIds;
  final List<String> enrolledClassIds;
  final List<String> following;
  final List<String> followers;

  @override
  List<Object?> get props => [uid, email];

  @override
  String toString() {
    return 'LocalUser(uid: $uid, email: $email,bio: $bio, points:$points, '
        'fullName: $fullName)';
  }
}
