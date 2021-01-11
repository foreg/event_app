// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_tickets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableTickets _$AvailableTicketsFromJson(Map<String, dynamic> json) {
  return AvailableTickets(
    id: intFromString(json['id'] as String),
    availableCount: json['available_count'] as int,
    ticketId: intFromString(json['ticketId'] as String),
  );
}

Map<String, dynamic> _$AvailableTicketsToJson(AvailableTickets instance) =>
    <String, dynamic>{
      'id': instance.id,
      'available_count': instance.availableCount,
      'ticketId': instance.ticketId,
    };
