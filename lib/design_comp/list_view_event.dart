import 'package:event_list/backend/models/event.dart';
import 'package:event_list/design_comp/event_card.dart';
import 'package:event_list/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListViewEvent extends StatelessWidget {
  final List<Event> events;

  const ListViewEvent({required this.events});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        var event = events[index];
        // print(eventProvider.eventList.length);
        return Padding(
          padding:
              const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
          child: GestureDetector(
            onTap: () {
              final eventWebViewController = WebViewController()
                ..setJavaScriptMode(JavaScriptMode.unrestricted)
                ..loadRequest(Uri.parse(event.eventUrl));
              Navigator.pushNamed(context, webViewRoute,
                  arguments: eventWebViewController);
            },
            child: EventCard(
                bannerUrl: event.bannerUrl,
                eventName: event.eventName,
                // ignore: prefer_interpolation_to_compose_strings
                eventDate: event.startTimeDisplay.toString().split(' ')[2] +
                    " " +
                    event.startTimeDisplay.toString().split(' ')[1] +
                    " " +
                    event.startTimeDisplay.toString().split(' ')[3],
                venueStreet: event.venue.street,
                venueCity: event.venue.city),
          ),
        );
      },
    );
  }
}
