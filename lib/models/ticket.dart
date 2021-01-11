import 'package:event_app/models/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@JsonSerializable(nullable: false)
class Ticket {
  @JsonKey(fromJson: intFromString)
  final int id;
  final String description;
  final String name;
  final String imageId;
  final int eventId;
  final int count;
  final double price;

  Ticket({
    this.id,
    this.description,
    this.name,
    this.imageId,
    this.eventId,
    this.count,
    this.price,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
