import 'package:event_app/core/widgets/numeric_up_down.dart';
import 'package:event_app/models/event.dart';
import 'package:event_app/models/ticket.dart';
import 'package:event_app/pages/purchase_page.dart';
import 'package:event_app/repositories/events_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class EventPage extends StatefulWidget {
  static const routeName = '/event';

  final Event event;

  const EventPage({Key key, this.event}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  Event args;
  Future<Map<Ticket, int>> ticketsFuture;
  Map<int, int> selected = {};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = widget.event ?? ModalRoute.of(context).settings.arguments;
    ticketsFuture = EventsRepository.fetchTickets(eventId: args.id);
  }

  void _onAdd(int index, int max) {
    setState(() {
      if (selected.containsKey(index)) {
        if (selected[index] < max) {
          selected[index]++;
        }
      } else {
        selected[index] = 0;
      }
    });
  }

  void _onRemove(int index) {
    setState(() {
      if (selected.containsKey(index)) {
        if (selected[index] > 0) {
          selected[index]--;
        }
      } else {
        selected[index] = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var assetImage = 'assets/images/concert2.jpg';
    switch (args.name) {
      case 'Bring Me the Horizon':
        assetImage = 'assets/images/bmth2.jpg';
        break;
      case 'Korn':
        assetImage = 'assets/images/korn2.jpg';
        break;
    }
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(24),
        topRight: const Radius.circular(24),
      ),
      panel: _panel(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(assetImage),
          ),
        ),
      ),
    );
  }

  Widget _panel() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 11),
              Align(
                alignment: Alignment.center,
                child: Container(color: Colors.grey, width: 50, height: 2),
              ),
              SizedBox(height: 11),
              Text(
                args.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              Row(
                children: [
                  Text(
                    DateFormat.yMMMd('ru').format(args.eventDate),
                  ),
                  SizedBox(width: 16),
                  // Text(
                  //   args['time'],
                  // ),
                ],
              ),
              SizedBox(height: 48),
              FutureBuilder<Map<Ticket, int>>(
                future: ticketsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var entry in snapshot.data.entries)
                          _ticketRow(
                            id: entry.key.id,
                            name: entry.key.name,
                            price: entry.key.price.toString(),
                            count: entry.value,
                          )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PurchasePage.routeName,
                    arguments: args,
                  );
                },
                child: Text('Купить'),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _ticketRow({int id, String name, String price, int count}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text('Осталось билетов: $count'),
            ],
          ),
          Text('$price Р'),
          NumericUpDown(
            onAdd: () => _onAdd(id, count),
            onRemove: () => _onRemove(id),
            value: selected[id] ?? 0,
          ),
        ],
      ),
    );
  }
}
