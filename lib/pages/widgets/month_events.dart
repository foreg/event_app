import 'package:event_app/core/widgets/date_card.dart';
import 'package:event_app/core/widgets/event_card.dart';
import 'package:event_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthEvents extends StatelessWidget {
  final String title;
  final Map<String, List<Event>> days;

  const MonthEvents({Key key, this.title, this.days}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16 + 30 + 8.0,
            top: 16,
            bottom: 16,
          ),
          child: Text(
            DateFormat.MMMM().format(DateTime.parse(title)),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        for (var day in days.entries) _dayEvents(day)
      ],
    );
  }

  Widget _dayEvents(MapEntry<String, List<Event>> day) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateCard(date: DateTime.parse(day.key)),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                for (var event in day.value) EventCard(event: event),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
