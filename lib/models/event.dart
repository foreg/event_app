import 'package:json_annotation/json_annotation.dart';

import 'package:event_app/models/genre.dart';
import 'package:event_app/models/utils.dart';

part 'event.g.dart';

@JsonSerializable(nullable: false)
class Event {
  @JsonKey(fromJson: intFromString)
  final int id;
  final String description;
  @JsonKey(name: 'locationdescription')
  final String locationDescription;
  @JsonKey(fromJson: doubleFromString)
  final double latitude;
  @JsonKey(fromJson: doubleFromString)
  final double longitude;
  final String name;
  @JsonKey(name: 'eventdate')
  final DateTime eventDate;
  final Genre genre;
  @JsonKey(name: 'min_age')
  final int minAge;

  Event({
    this.id,
    this.description,
    this.locationDescription,
    this.latitude,
    this.longitude,
    this.name,
    this.eventDate,
    this.genre,
    this.minAge,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
