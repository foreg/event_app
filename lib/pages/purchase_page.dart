import 'dart:async';

import 'package:event_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchasePage extends StatefulWidget {
  static const routeName = '/purchase';

  final Map<String, dynamic> event;

  const PurchasePage({Key key, this.event}) : super(key: key);

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
  final _formKey = GlobalKey<FormState>();
  Event args;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(minutes: 10), () {
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = widget.event ?? ModalRoute.of(context).settings.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                args.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Row(
                children: [
                  Text(
                    DateFormat.yMMMd('ru').format(args.eventDate),
                  ),
                  // SizedBox(width: 16),
                  // Text(widget.event['time']),
                ],
              ),
              SizedBox(height: 8),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Введите email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Text(
                'Внимание!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                  'Ваш билет забронирован. Если через 10 минут Вы не оплатите его, то бронь будет отменена'),
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _showSnackBar();
                      }
                    },
                    child: Text('Оплатить'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar() async {
    await Future.delayed(Duration(seconds: 1));
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Успешная оплата')));
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }
}
