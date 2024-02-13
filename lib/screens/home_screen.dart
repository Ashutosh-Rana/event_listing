import 'package:event_list/backend/providers/event_provider.dart';
import 'package:event_list/design_comp/rounded_card_items.dart';
import 'package:event_list/ui_states/event_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  late EventProvider eventProvider;

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);
    return Scaffold(
            backgroundColor: Colors.grey,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.lightBlueAccent,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 16.0),
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: RoundedCardWithItems(),
                  ),
                ],
              ),
            ));
  }
}
