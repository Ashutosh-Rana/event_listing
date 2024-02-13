import 'package:event_list/backend/models/event.dart';
import 'package:event_list/design_comp/grid_event_card.dart';
import 'package:event_list/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GridViewEvent extends StatelessWidget {
  final List<Event> events;

  const GridViewEvent({required this.events});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;
    return GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: (itemWidth / itemHeight),
        crossAxisCount: 2, // Set the number of columns as needed
        crossAxisSpacing: 8.0, // Adjust the spacing between columns
        mainAxisSpacing: 8.0, // Adjust the spacing between rows
      ),
      
      itemCount: events.length,
      itemBuilder: (context, index) {
        var event = events[index];
        return GestureDetector(
          onTap: () {
            final eventWebViewController = WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(event.eventUrl));
            Navigator.pushNamed(context, webViewRoute,
                arguments: eventWebViewController);
          },
          child: GridEventCard(
            bannerUrl: event.bannerUrl,
            eventName: event.eventName,
            eventDate: event.startTimeDisplay.toString().split(' ')[2] +
                " " +
                event.startTimeDisplay.toString().split(' ')[1] +
                " " +
                event.startTimeDisplay.toString().split(' ')[3],
            venueStreet: event.venue.street,
            venueCity: event.venue.city,
          ),
        );
      },
    );
  }
}
