import 'package:project2/core/utils/typedefs.dart';
import 'package:project2/src/auth/domain/entities/user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.uid,
    required super.email,
    required super.fullName,
    required super.points,
    super.enrolledGroupsIds,
    super.enrolledClassIds,
    super.followers,
    super.following,
    super.profilePic,
    super.bio,
  });
  LocalUserModel.fromMap(Map<String, dynamic> map)
      : super(
          uid: map['uid'] as String,
          email: map['email'] as String,
          fullName: map['fullName'] as String,
          points: (map['points'] as num).toInt(),
          enrolledGroupsIds:
              List<String>.from(map['enrolledGroupsIds'] as List<dynamic>)
                  .cast<String>(),
          enrolledClassIds:
              List<String>.from(map['enrolledClassIds'] as List<dynamic>)
                  .cast<String>(),
          followers: List<String>.from(map['followers'] as List<dynamic>)
              .cast<String>(),
          following: List<String>.from(map['following'] as List<dynamic>)
              .cast<String>(),
          profilePic: map['profilePic'] as String,
          bio: map['bio'] as String,
        );

  const LocalUserModel.empty()
      : super(
          uid: '',
          email: '',
          fullName: '',
          points: 0,
          enrolledGroupsIds: const [],
          enrolledClassIds: const [],
          followers: const [],
          following: const [],
          bio: '',
          profilePic: '',
        );

  LocalUser copyWith({
    String? uid,
    String? email,
    String? fullName,
    int? points,
    String? profilePic,
    String? bio,
    List<String>? enrolledGroupsIds,
    List<String>? enrolledClassIds,
    List<String>? following,
    List<String>? followers,
  }) {
    return LocalUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      points: points ?? this.points,
      profilePic: profilePic ?? this.profilePic,
      bio: bio ?? this.bio,
      enrolledGroupsIds: enrolledGroupsIds ?? this.enrolledGroupsIds,
      enrolledClassIds: enrolledClassIds ?? this.enrolledClassIds,
      following: following ?? this.following,
      followers: followers ?? this.followers,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'points': points,
      'profilePic': profilePic,
      'bio': bio,
      'enrolledGroupsIds': enrolledGroupsIds,
      'enrolledClassIds': enrolledClassIds,
      'following': following,
      'followers': followers,
    };
  }
}
