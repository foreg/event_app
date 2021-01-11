import 'package:event_app/pages/widgets/ticket_row.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditEventPage extends StatefulWidget {
  static const routeName = '/edit';

  final Map<String, dynamic> event;

  const EditEventPage({Key key, this.event}) : super(key: key);

  @override
  _EditEventPageState createState() => _EditEventPageState();
}

class _EditEventPageState extends State<EditEventPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateTimeController = TextEditingController();

  final _tickets = Map<Widget, List<TextEditingController>>();

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      _addTicket();
    } else {
      _nameController.text = widget.event['name'];
      final date =
          DateTime.parse(widget.event['date'] + 'T' + widget.event['time']);
      _dateTimeController.text = date.toIso8601String();
      for (var ticket in widget.event['tickets']) {
        _addTicket(
          name: ticket['name'],
          price: ticket['price'],
          count: ticket['count'],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Создание мероприятия',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      autofocus: true,
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Название',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Введите название';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _dateTimeController,
                      decoration: InputDecoration(
                        labelText: 'Дата и время',
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 730)),
                        );
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        _dateTimeController.text = DateTime(date.year,
                                date.month, date.day, time.hour, time.minute)
                            .toIso8601String();
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Выберите дату и время';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text('Количество билетов'),
                    for (var ticket in _tickets.keys) ticket,
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          setState(() {
                            _addTicket();
                          });
                        },
                        child: Text('Добавить'),
                      ),
                    ),
                    SizedBox(height: 48),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _showSnackBar();
                    }
                  },
                  child: Text('Создать'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar() async {
    await Future.delayed(Duration(seconds: 1));
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('Создано')));
    print(_nameController.text);
    print(_dateTimeController.text);
    for (var row in _tickets.values) {
      print(row[0].text);
      print(row[1].text);
      print(row[2].text);
    }
  }

  void _addTicket({String name, String price, String count}) {
    final key = UniqueKey();
    final ticketControllers = [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ];
    if (name != null && price != null && count != null) {
      ticketControllers[0].text = name;
      ticketControllers[1].text = price;
      ticketControllers[2].text = count;
    }
    _tickets[TicketRow(
      key: key,
      nameController: ticketControllers[0],
      priceController: ticketControllers[1],
      countController: ticketControllers[2],
      onDelete: () {
        setState(() {
          if (_tickets.length > 1) {
            _tickets.removeWhere((k, v) => k.key == key);
          } else {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Должен быть хотя бы 1 тип билетов')));
          }
        });
      },
    )] = ticketControllers;
  }
}
