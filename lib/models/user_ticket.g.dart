// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTicket _$UserTicketFromJson(Map<String, dynamic> json) {
  return UserTicket(
    id: json['id'] as int,
    userId: json['userId'] as int,
    tidketId: json['tidketId'] as int,
    purchareDate: DateTime.parse(json['purchareDate'] as String),
  );
}

Map<String, dynamic> _$UserTicketToJson(UserTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'tidketId': instance.tidketId,
      'purchareDate': instance.purchareDate.toIso8601String(),
    };
