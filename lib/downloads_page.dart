import 'package:flutter/material.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Download Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Implement download functionality for Sales Report
            },
            child: const Text('Download Sales Report'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement download functionality for Inventory Report
            },
            child: const Text('Download Inventory Report'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement download functionality for Customer Report
            },
            child: const Text('Download Customer Report'),
          ),
          // Add more buttons as needed
        ],
      ),
    );
  }
}