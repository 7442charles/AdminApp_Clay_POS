import 'package:flutter/material.dart';
import 'barcode_scanner_logic.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({super.key});

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  BarcodeScannerLogic logic = BarcodeScannerLogic();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await logic.scanBarcode(context); // Open camera to scan barcode
              setState(() {}); // Update the UI after scanning
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
          // Input fields for name, buying price, selling price, and quantity
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
            controller: logic.buyingPriceController,
            decoration: const InputDecoration(
              labelText: "Buying Price",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            enabled: logic.isScanned, // Disable if item is not scanned
          ),
          const SizedBox(height: 10),
          TextField(
            controller: logic.sellingPriceController,
            decoration: const InputDecoration(
              labelText: "Selling Price",
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
            enabled: logic.isScanned, // Disable if item is not scanned
          ),
          const SizedBox(height: 20),
          // Submit button
          ElevatedButton(
            onPressed: logic.isScanned ? _handleSubmit : null,
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  void _handleSubmit() {
    final buyingPrice = double.tryParse(logic.buyingPriceController.text);
    final sellingPrice = double.tryParse(logic.sellingPriceController.text);

    if (buyingPrice != null && sellingPrice != null) {
      if (sellingPrice < buyingPrice) {
        _showAlertDialog("Selling price cannot be lower than buying price.");
      } else if (sellingPrice == buyingPrice) {
        _showAlertDialog(
            "Selling price is equal to buying price. Please review.");
      } else {
        _showConfirmationDialog();
      }
    } else {
      _showAlertDialog("Please enter valid numeric values for prices.");
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirm Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Product Name: ${logic.nameController.text}"),
              Text("Buying Price: ${logic.buyingPriceController.text}"),
              Text("Selling Price: ${logic.sellingPriceController.text}"),
              Text("Quantity: ${logic.quantityController.text}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog to edit
              },
              child: const Text("Edit"),
            ),
            TextButton(
              onPressed: () {
                logic.submitData(); // Submit data
                Navigator.of(context).pop(); // Close dialog after submission
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // Corrected this line
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
