import 'dart:convert';

import 'package:event_app/models/available_tickets.dart';
import 'package:event_app/models/event.dart';
import 'package:event_app/models/ticket.dart';
import 'package:http/http.dart' as http;

class EventsRepository {
  static String host = 'http://10.0.2.2:8000';
  static String baseUrl = '$host/api/v1';

  static Future<List<Event>> fetchEvents() async {
    final response = await http.get('$baseUrl/event/', headers: {
      'Authorization': 'Token bab68928ef271b9dee0ee065b7e9ca154ac58f2e',
    });
    final List<Event> result = [];
    if (response.statusCode == 200) {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      for (var event in decoded['data']) {
        (event['attributes'] as Map)['id'] = event['id'];
        result.add(Event.fromJson((event['attributes'])));
      }
    } else {
      throw Exception('Failed to load events');
    }
    return result;
  }

  static Future<Map<Ticket, int>> fetchTickets({int eventId}) async {
    final response = await http.get('$baseUrl/ticket/', headers: {
      'Authorization': 'Token bab68928ef271b9dee0ee065b7e9ca154ac58f2e',
    });
    final List<Ticket> result = [];
    if (response.statusCode == 200) {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      for (var ticket in decoded['data']) {
        (ticket['attributes'] as Map)['id'] = ticket['id'];
        if (eventId != null && ticket['attributes']['event_id'] == eventId) {
          result.add(Ticket.fromJson((ticket['attributes'])));
        }
      }
    } else {
      throw Exception('Failed to load tickets');
    }
    final availableTickets = await fetchAvailableTickets(
        ticketIds: result.map((e) => e.id).toList());
    final Map<Ticket, int> resultMap = {};
    result.forEach((e) {
      resultMap[e] = availableTickets
          .where((element) => element.ticketId == e.id)
          .first
          .availableCount;
    });
    return resultMap;
  }

  static Future<List<AvailableTickets>> fetchAvailableTickets(
      {List<int> ticketIds}) async {
    final response = await http.get('$baseUrl/availabletickets/', headers: {
      'Authorization': 'Token bab68928ef271b9dee0ee065b7e9ca154ac58f2e',
    });
    final List<AvailableTickets> result = [];
    if (response.statusCode == 200) {
      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      for (var availableTicket in decoded['data']) {
        (availableTicket['attributes'] as Map)['id'] = availableTicket['id'];
        (availableTicket['attributes'] as Map)['ticketId'] =
            availableTicket['relationships']['ticket_id']['data']['id'];
        if (ticketIds != null &&
            ticketIds.contains(
                int.parse(availableTicket['attributes']['ticketId']))) {
          result
              .add(AvailableTickets.fromJson((availableTicket['attributes'])));
        }
      }
    } else {
      throw Exception('Failed to load AvailableTickets');
    }
    return result;
  }
}
