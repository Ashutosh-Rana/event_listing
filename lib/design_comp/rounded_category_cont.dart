import 'package:event_list/backend/providers/event_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoundedCategoryContainer extends StatefulWidget {
  final String category;
  final ValueChanged<String> onCategorySelected;

  RoundedCategoryContainer({
    required this.category,
    required this.onCategorySelected,
  });

  @override
  _RoundedCategoryContainerState createState() =>
      _RoundedCategoryContainerState();
}

class _RoundedCategoryContainerState extends State<RoundedCategoryContainer> {
  bool isSelected = false;
  late EventProvider eventProvider;

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);

    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.category,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onCategorySelected(widget.category);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        width: textPainter.width + 48.0,
        height: 50,
        decoration: BoxDecoration(
          color: eventProvider.selectedCategory == widget.category
              ? Colors.lightBlueAccent
              : Colors.white.withOpacity(0.5), // Change color based on selection
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            widget.category,
            style: TextStyle(
              color: eventProvider.selectedCategory == widget.category
              ? Colors.white
              : Colors.grey, // Choose your text color
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
