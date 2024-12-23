import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.points,
    required this.enrolledGroupsIds,
    required this.followers,
    required this.following,
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
        );

  final String uid;
  final String email;
  final String fullName;
  final int points;
  final String? profilePic;
  final String? bio;
  final List<String> enrolledGroupsIds;
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
