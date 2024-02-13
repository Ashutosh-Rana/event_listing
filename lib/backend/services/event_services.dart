import 'dart:convert';
import 'package:event_list/backend/models/event.dart';
import 'package:event_list/backend/models/event_category.dart';
import 'package:http/http.dart' as http;

class EventService {
  Future<List<EventCategory>> fetchEventCategories() async {
    final Uri url =
        Uri.parse('https://allevents.s3.amazonaws.com/tests/categories.json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      // print(jsonList);
      List<EventCategory> eventCategoryList =
          jsonList.map((json) => EventCategory.fromJson(json)).toList();
      print(eventCategoryList[0].category);
      return eventCategoryList;
    } else {
      throw Exception('Failed to load event categories');
    }
  }

  Future<List<Event>> fetchEventsForCategory(String categoryUrl) async {
    final Uri url = Uri.parse(categoryUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey('item')) {
        final List<dynamic> jsonList = jsonResponse['item'];
        List<Event> eventList =
            jsonList.map((json) => Event.fromJson(json)).toList();
        return eventList;
      } else {
        throw Exception('Invalid response structure: Missing "item" field.');
      }
    } else {
      throw Exception('Failed to load events for the selected category');
    }
  }
}
