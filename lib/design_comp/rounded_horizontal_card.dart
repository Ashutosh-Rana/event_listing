import 'package:event_list/backend/providers/event_provider.dart';
import 'package:event_list/design_comp/card_item.dart';
import 'package:event_list/design_comp/horizontal_card_item.dart';
import 'package:event_list/utils/category_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedHorizontalCard extends StatefulWidget {
  @override
  _RoundedHorizontalCardState createState() => _RoundedHorizontalCardState();
}

class _RoundedHorizontalCardState extends State<RoundedHorizontalCard> {
  String selectedCategory = '';
  late EventProvider eventProvider;

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HorizontalCardItem(
              icon: Icons.category,
              text: 'Categories',
              isSelected: true,
              onTap: () {
                // print("HII");
                // _showModalSheet(context, 'Categories');
              },
            ),
            HorizontalCardItem(
              icon: Icons.date_range,
              text: 'Date & Time',
              isSelected: selectedCategory == 'Date & Time',
              onTap: () {
                // _showModalSheet(context, 'Date & Time');
              },
            ),
            HorizontalCardItem(
              icon: Icons.sort,
              text: 'Sort',
              isSelected: selectedCategory == 'Sort',
              onTap: () {
                // _showModalSheet(context, 'Sort');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showModalSheet(BuildContext context, String category) {
    setState(() {
      selectedCategory = category;
    });
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.grey,
                thickness: 5,
                indent: MediaQuery.of(context).size.height * 0.15,
                endIndent: MediaQuery.of(context).size.height * 0.15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SizedBox(width: MediaQuery.of(context).size.width*.8,),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Text('Bottom Modal Sheet for $category'),
              // ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              selectedCategory == "Categories"
                  ? CategoryList()
                  : Text(selectedCategory)
            ],
          ),
        );
      },
    );
  }
}
