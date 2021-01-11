// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSession _$UserSessionFromJson(Map<String, dynamic> json) {
  return UserSession(
    id: json['id'] as int,
    userId: json['userId'] as int,
    tidketId: json['tidketId'] as int,
    openedAt: DateTime.parse(json['openedAt'] as String),
    status: json['status'] as bool,
  );
}

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tidketId': instance.tidketId,
      'openedAt': instance.openedAt.toIso8601String(),
      'status': instance.status,
    };
