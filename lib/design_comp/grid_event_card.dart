import 'package:flutter/material.dart';

class GridEventCard extends StatelessWidget {
  final String bannerUrl;
  final String eventName;
  final String eventDate;
  final String venueStreet;
  final String venueCity;

  const GridEventCard({
    required this.bannerUrl,
    required this.eventName,
    required this.eventDate,
    required this.venueStreet,
    required this.venueCity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: MediaQuery.of(context).size.width*.4,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        surfaceTintColor: Colors.white,
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(bannerUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    eventDate,
                    softWrap: false,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}