// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return Ticket(
    id: intFromString(json['id'] as String),
    description: json['description'] as String,
    name: json['name'] as String,
    imageId: json['imageId'] as String,
    eventId: json['eventId'] as int,
    count: json['count'] as int,
    price: (json['price'] as num).toDouble(),
  );
}

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'name': instance.name,
      'imageId': instance.imageId,
      'eventId': instance.eventId,
      'count': instance.count,
      'price': instance.price,
    };
