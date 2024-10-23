import 'package:flutter/material.dart';
import 'package:myapp/barcode_scanner_screen.dart';
import 'package:myapp/homepage.dart'; // Ensure this file contains the HomePage widget
import 'package:myapp/stockpage.dart'; // Ensure this file contains the StockPage widget
import 'package:myapp/downloads_page.dart'; // Import the Downloads page

void main() {
  runApp(const ClayMartAdminApp());
}

class ClayMartAdminApp extends StatelessWidget {
  const ClayMartAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClayMart Admin',
      theme: ThemeData(
        primaryColor: const Color(0xFFFF0040),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFF0040),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFFF0040),
          unselectedItemColor: Colors.black54,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFFF0040),
          ),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    const HomePage(), // Home tab content
    const BarcodeScannerScreen(), // Barcode scanner tab content
    StockPage(), // Stock tab content
    const DownloadsPage(), // Downloads tab content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Selected index: $_selectedIndex'); // Debugging line
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center( // Center the title
          child: Text(
            'ClayMart Admin',
            style: TextStyle(
              fontSize: 24, // Increased font size
              fontWeight: FontWeight.bold, 
            ),
          ),
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Barcode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Stock',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}