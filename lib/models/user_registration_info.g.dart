// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registration_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegistrationInfo _$UserRegistrationInfoFromJson(Map<String, dynamic> json) {
  return UserRegistrationInfo(
    id: json['id'] as int,
    email: json['email'] as String,
    phone: json['phone'] as String,
    password: json['password'] as String,
    userRole: _$enumDecode(_$RoleEnumMap, json['userRole']),
  );
}

Map<String, dynamic> _$UserRegistrationInfoToJson(
        UserRegistrationInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'userRole': _$RoleEnumMap[instance.userRole],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$RoleEnumMap = {
  Role.anonymous: 'anon_user',
  Role.user: 'user',
  Role.admin: 'admin',
};
