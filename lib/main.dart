import 'package:event_app/mock/mock_data.dart';
import 'package:event_app/pages/auth_page.dart';
import 'package:event_app/pages/edit_event_page.dart';
import 'package:event_app/pages/event_page.dart';
import 'package:event_app/pages/home_page.dart';
import 'package:event_app/pages/purchase_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() async {
  Intl.defaultLocale = 'ru';
  await initializeDateFormatting('ru');
  runApp(EventApp());
}

class EventApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event app',
      initialRoute: '/',
      routes: {
        HomePage.routeName: (context) => _wrapWithScaffold(HomePage()),
        EventPage.routeName: (context) => _wrapWithScaffold(EventPage()),
        PurchasePage.routeName: (context) => _wrapWithScaffold(PurchasePage()),
      },
      // home: Scaffold(
      //   body: SafeArea(
      //     child: HomePage(),
      //     // child: EventPage(event: eventsData['months'][0]['days'][0]['events'][0]),
      //     // child: PurchasePage(
      //     //     event: eventsData['months'][0]['days'][0]['events'][0]),
      //     // child: EditEventPage(),
      //     // child: EditEventPage(
      //     //     event: eventsData['months'][0]['days'][0]['events'][0]),
      //     // child: AuthPage(),
      //   ),
      // ),
    );
  }

  Widget _wrapWithScaffold(Widget child) {
    return Scaffold(
      body: SafeArea(
        child: child,
      ),
    );
  }
}
