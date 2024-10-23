import 'package:flutter/material.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        mainAxisSpacing: 10, // Space between rows
        crossAxisSpacing: 10, // Space between columns
        childAspectRatio: 1.5, // Aspect ratio for each grid item
        children: [
          _buildGridButton(
            context,
            'Download Sales Report',
            () {
              // Implement download functionality for Sales Report
            },
            Colors.blue[100], // Light blue background
          ),
          _buildGridButton(
            context,
            'Download Inventory Report',
            () {
              // Implement download functionality for Inventory Report
            },
            Colors.green[100], // Light green background
          ),
          _buildGridButton(
            context,
            'Download Customer Report',
            () {
              // Implement download functionality for Customer Report
            },
            Colors.orange[100], // Light orange background
          ),
          _buildGridButton(
            context,
            'Generate Price Tags',
            () {
              // Implement download functionality for Price Tags
            },
            Colors.purple[100], // Light purple background
          ),
        ],
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String title, VoidCallback onPressed, Color? bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor ?? Colors.grey[200], // Use the provided background color or a default
        borderRadius: BorderRadius.circular(8), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // Make button background transparent
          elevation: 0, // Remove button elevation
          padding: const EdgeInsets.all(16.0), // Padding inside the button
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}