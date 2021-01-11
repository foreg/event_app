import 'package:json_annotation/json_annotation.dart';

enum Role {
  @JsonValue('anon_user')
  anonymous,
  @JsonValue('user')
  user,
  @JsonValue('admin')
  admin,
}

extension GenreExtension on Role {
  static const _names = {
    Role.anonymous: 'Аноним',
    Role.user: 'Пользователь',
    Role.admin: 'Админ',
  };

  String get name => _names[this];
}
