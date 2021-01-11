import 'package:event_app/models/role.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_ticket.g.dart';

@JsonSerializable(nullable: false)
class UserTicket {
  final int id;
  final int userId;
  final int tidketId;
  final DateTime purchareDate;

  UserTicket({
    this.id,
    this.userId,
    this.tidketId,
    this.purchareDate,
  });

  factory UserTicket.fromJson(Map<String, dynamic> json) =>
      _$UserTicketFromJson(json);
  Map<String, dynamic> toJson() => _$UserTicketToJson(this);
}
