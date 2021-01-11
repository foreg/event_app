import 'package:event_app/models/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_session.g.dart';

@JsonSerializable(nullable: false)
class UserSession {
  final int id;
  final int userId;
  final int tidketId;
  final DateTime openedAt;
  final bool status;

  UserSession({
    this.id,
    this.userId,
    this.tidketId,
    this.openedAt,
    this.status,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
  Map<String, dynamic> toJson() => _$UserSessionToJson(this);
}
