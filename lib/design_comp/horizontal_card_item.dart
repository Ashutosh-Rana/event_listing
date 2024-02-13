import 'package:flutter/material.dart';

class HorizontalCardItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  HorizontalCardItem({
    required this.icon,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.lightBlueAccent : null,
            ),
            SizedBox(height: 8),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.lightBlueAccent : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}