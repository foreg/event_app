import 'package:event_app/models/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'available_tickets.g.dart';

@JsonSerializable(nullable: false)
class AvailableTickets {
  @JsonKey(fromJson: intFromString)
  final int id;
  @JsonKey(name: 'available_count')
  final int availableCount;
  @JsonKey(fromJson: intFromString)
  final int ticketId;

  AvailableTickets({
    this.id,
    this.availableCount,
    this.ticketId,
  });

  factory AvailableTickets.fromJson(Map<String, dynamic> json) =>
      _$AvailableTicketsFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableTicketsToJson(this);
}
