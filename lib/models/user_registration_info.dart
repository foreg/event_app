import 'package:event_app/models/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_registration_info.g.dart';

@JsonSerializable(nullable: false)
class UserRegistrationInfo {
  final int id;
  final String email;
  final String phone;
  final String password;
  final Role userRole;

  UserRegistrationInfo({
    this.id,
    this.email,
    this.phone,
    this.password,
    this.userRole,
  });

  factory UserRegistrationInfo.fromJson(Map<String, dynamic> json) =>
      _$UserRegistrationInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserRegistrationInfoToJson(this);
}
