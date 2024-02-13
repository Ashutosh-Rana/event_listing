import 'package:event_list/backend/providers/event_provider.dart';
import 'package:event_list/design_comp/grid_view_event.dart';
import 'package:event_list/design_comp/list_view_event.dart';
import 'package:event_list/design_comp/rounded_horizontal_card.dart';
import 'package:event_list/ui_states/event_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventScreen extends StatefulWidget {
  final String categoryData;

  const EventScreen({super.key, required this.categoryData});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late EventProvider eventProvider;
  bool isGridView = false;

  void initState() {
    super.initState();
    eventProvider = Provider.of<EventProvider>(context, listen: false);
    Future.delayed(
      Duration.zero,
      () {
        fetchEventData();
      },
    );
  }

  void fetchEventData() async {
    try {
      await eventProvider.fetchEventsForCategory(widget.categoryData);
      print(eventProvider.eventList.length);
    } catch (error) {
      // Handle the error (e.g., show an error message)
      print('Error fetching event data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.lightBlueAccent,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(eventProvider.selectedCategory),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action
            },
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: context.watch<EventProvider>().eventCategoryState ==
              EventCategoryState.eventLoading
          ? Center(
              child: CircularProgressIndicator(color: Colors.lightBlueAccent),
            )
          : Container(
              color: Colors.grey,
              height: MediaQuery.of(context).size.height * .89,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  RoundedHorizontalCard(),
                  SizedBox(
                    height: 10,
                  ),
                  isGridView
                      ? GridViewEvent(events: eventProvider.eventList)
                      : ListViewEvent(events: eventProvider.eventList)
                ]),
              ),
            ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.lightBlueAccent,
        ),
        child: ToggleButtons(
          isSelected: [!isGridView, isGridView],
          onPressed: (index) {
            setState(() {
              isGridView = !isGridView;
            });
          },
          children: [
            Icon(Icons.list),
            Icon(Icons.grid_on),
          ],
        ),
      ),
    );
  }
}
