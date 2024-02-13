import 'package:event_list/backend/models/event.dart';
import 'package:event_list/backend/providers/event_provider.dart';
import 'package:event_list/backend/services/event_services.dart';
import 'package:event_list/design_comp/rounded_category_cont.dart';
import 'package:event_list/ui_states/event_state.dart';
import 'package:event_list/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late EventProvider eventProvider;
  List<Event> events=[];

  void initState() {
    super.initState();
    eventProvider = Provider.of<EventProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    // final eventProvider = Provider.of<EventProvider>(context);

    return FutureBuilder(
      future: eventProvider.fetchEventCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // print(snapshot.data);
          // eventProvider.setCategories(snapshot.data!);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .5,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Wrap(
                    spacing: 20.0, // Adjust the spacing between containers
                    runSpacing: 20, // Adjust the spacing between rows
                    children: eventProvider.categories.map((category) {
                      return RoundedCategoryContainer(
                        category: category.category,
                        onCategorySelected: (selectedCategory) async {
                          print('Selected Category: $selectedCategory');
                          eventProvider.setSelectedCategory(selectedCategory);
                          Navigator.pushNamed(context, eventRoute, arguments: category.data);
                          // events= await eventProvider.fetchEventsForCategory(category.data);
                          // if(eventProvider.eventCategoryState==EventCategoryState.eventLoadedSucessfully){
                          //   Navigator.pushNamed(context, eventRoute);
                          // }
                          // Navigator.pushNamed(context, eventRoute);
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
