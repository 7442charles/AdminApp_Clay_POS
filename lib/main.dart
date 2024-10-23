import 'package:flutter/material.dart';
import 'barcode_scanner_logic.dart'; // Import the logic file

void main() {
  runApp(const ClayMartAdminApp());
}

class ClayMartAdminApp extends StatelessWidget {
  const ClayMartAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClayMart Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BarcodeScannerScreen(),
    );
  }
}

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  BarcodeScannerLogic logic = BarcodeScannerLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ClayMart Admin"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Show camera preview only after barcode is scanned
            if (logic.isScanned)
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300], // Placeholder for camera preview
                child: const Center(
                  child: Text("Camera Preview Here"),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await logic.scanBarcode(context); // Open camera and scan barcode
                setState(() {}); // Update UI after barcode is scanned
              },
              child: const Text("Scan New Item"),
            ),
            const SizedBox(height: 10),
            if (logic.barcodeValue.isNotEmpty)
              Text(
                "Scanned Barcode: ${logic.barcodeValue}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 20),

            // Input fields for name, price, and quantity
            TextField(
              controller: logic.nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
              enabled: logic.isScanned, // Disable if item is not scanned
            ),
            const SizedBox(height: 10),
            TextField(
              controller: logic.priceController,
              decoration: const InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              enabled: logic.isScanned, // Disable if item is not scanned
            ),
            const SizedBox(height: 10),
            TextField(
              controller: logic.quantityController,
              decoration: const InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              enabled: logic.isScanned, // Disable if item is not scanned
            ),
            const SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: logic.isScanned ? () => logic.submitData() : null,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
