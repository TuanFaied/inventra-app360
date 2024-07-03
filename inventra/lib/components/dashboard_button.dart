import 'package:flutter/material.dart';

class DashboardButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onPressed;

  DashboardButton({required this.iconPath, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFF18c9cd),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ImageIcon(AssetImage(iconPath), color: Colors.white, size: 30),
          ),
          SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }
}