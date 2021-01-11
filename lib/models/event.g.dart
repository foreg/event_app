// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
    id: intFromString(json['id'] as String),
    description: json['description'] as String,
    locationDescription: json['locationdescription'] as String,
    latitude: doubleFromString(json['latitude'] as String),
    longitude: doubleFromString(json['longitude'] as String),
    name: json['name'] as String,
    eventDate: DateTime.parse(json['eventdate'] as String),
    genre: _$enumDecode(_$GenreEnumMap, json['genre']),
    minAge: json['min_age'] as int,
  );
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'locationdescription': instance.locationDescription,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'eventdate': instance.eventDate.toIso8601String(),
      'genre': _$GenreEnumMap[instance.genre],
      'min_age': instance.minAge,
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

const _$GenreEnumMap = {
  Genre.folk: 'фолк',
  Genre.country: 'кантри',
  Genre.latin: 'латиноамериканская',
  Genre.blues: 'блюз',
  Genre.jazz: 'джаз',
  Genre.chanson: 'шансон',
  Genre.electro: 'электро',
  Genre.rock: 'рок',
  Genre.hiphop: 'хип-хоп',
  Genre.reggae: 'регги',
  Genre.pop: 'поп',
  Genre.test: 'test',
};
