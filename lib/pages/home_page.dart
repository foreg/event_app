import 'package:event_app/extensions.dart';
import 'package:event_app/mock/mock_data.dart';
import 'package:event_app/models/event.dart';
import 'package:event_app/pages/widgets/month_events.dart';
import 'package:event_app/repositories/events_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Event>> eventsFuture;

  @override
  void initState() {
    super.initState();
    eventsFuture = EventsRepository.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<Event>>(
          future: eventsFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data.sort((a, b) => a.eventDate.compareTo(b.eventDate));
              final grouppedMap = snapshot.data
                  .groupBy((a) => '${a.eventDate.year}${a.eventDate.month.toString().padLeft(2,'0')}01');
              final List<Widget> monthEventsWidgets = [];
              grouppedMap.forEach((key, value) {
                final grouppedMap = value.groupBy((a) => '${a.eventDate}');
                monthEventsWidgets.add(MonthEvents(
                  title: key,
                  days: grouppedMap,
                ));
              });
              return Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: monthEventsWidgets,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 16, right: 16),
        //     child: CircleAvatar(
        //       backgroundColor: Colors.black,
        //       child: Icon(Icons.person, size: 14, color: Colors.white),
        //       radius: 13,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
