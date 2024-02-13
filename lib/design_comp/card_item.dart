import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  CategoryItem({
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
        child: Column(
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