import 'package:auto_size_text/auto_size_text.dart';
import 'package:event_app/models/event.dart';
import 'package:event_app/pages/event_page.dart';
import 'package:flutter/material.dart';
import 'package:event_app/models/genre.dart';

import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetImage = 'assets/images/concert1.jpg';
    switch (event.name) {
      case 'Bring Me the Horizon':
        assetImage = 'assets/images/bmth1.jpg';
        break;
      case 'Korn':
        assetImage = 'assets/images/korn1.jpg';
        break;
    }
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          EventPage.routeName,
          arguments: event,
        );
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: const Color(0xff000000),
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage(assetImage),
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(event.name ?? '', style: TextStyle(color: Colors.white)),
                  SizedBox(width: 16),
                  Text(event.genre.name ?? '', style: TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      event.description ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  // Icon(Icons.attach_money, size: 16),
                  // Text('${event['priceMin']} - ${event['priceMax']}'),
                  SizedBox(width: 16),
                  // Icon(Icons.access_time, size: 16),
                  // Text(' ${event['time']}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
