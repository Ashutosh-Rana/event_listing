import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String bannerUrl;
  final String eventName;
  final String eventDate;
  final String venueStreet;
  final String venueCity;

  const EventCard({
    required this.bannerUrl,
    required this.eventName,
    required this.eventDate,
    required this.venueStreet,
    required this.venueCity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        // color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 140, // Adjust the height as needed
              width: MediaQuery.of(context).size.width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(bannerUrl),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0,top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      eventName,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      eventDate, // Extracting only "Sep 14 2018"
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    // SizedBox(height: 8.0),
                    Text(
                      '$venueStreet, $venueCity',
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 1,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.login_outlined, size: 25),
                        ),
                      ),
                        SizedBox(width: 8.0),
                        Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.star_border_outlined, size: 25),
                        ),
                      ),
                        SizedBox(width: 10,)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
