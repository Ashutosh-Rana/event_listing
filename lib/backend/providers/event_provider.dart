import 'package:event_list/backend/models/event.dart';
import 'package:event_list/backend/models/event_category.dart';
import 'package:event_list/backend/services/event_services.dart';
import 'package:event_list/ui_states/event_state.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  List<EventCategory> _categories = [];

  bool isEventFetched = false;

  String selectedCategory = '';

  List<EventCategory> get categories => _categories;

  List<Event> _eventList = [];

  List<Event> get eventList => _eventList;

  List<Map<String,String>> eventDataCache=[];

  late EventCategoryState eventCategoryState = EventCategoryState.idle;

  EventService eventService = EventService();

  void setCategories(List<EventCategory> categories) {
    _categories = categories;
    print(_categories);
    notifyListeners();
  }

  void setEventCategoryState(EventCategoryState eventCategoryState){
    this.eventCategoryState=eventCategoryState;
    notifyListeners();
  }

  Future<void> fetchEventCategories() async {
    if (!isEventFetched) {
      _categories = await eventService.fetchEventCategories();
      isEventFetched = true;
      notifyListeners();
    }
  }

  void setSelectedCategory(String selectedCategory) {
    this.selectedCategory = selectedCategory;
    notifyListeners();
  }

  Future<List<Event>> fetchEventsForCategory(String categoryUrl) async {
    eventCategoryState=EventCategoryState.eventLoading;
    notifyListeners();
    _eventList = await eventService.fetchEventsForCategory(categoryUrl);
    eventCategoryState=EventCategoryState.eventLoadedSucessfully;
    notifyListeners();
    return _eventList;
  }
}
