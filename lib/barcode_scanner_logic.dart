import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class BarcodeScannerLogic {
  String barcodeValue = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  bool isScanned = false; // State to track if barcode is scanned

  // Function to scan barcode using the camera
  Future<void> scanBarcode(BuildContext context) async {
    try {
      // Use barcode_scan2 to scan a barcode
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        barcodeValue = result.rawContent; // Save the scanned barcode value
        isScanned = true; // Set the state to indicate that barcode is scanned

        // Show scanned value to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Barcode Scanned: $barcodeValue")),
        );
      }
    } catch (e) {
      // Handle any error that may occur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error scanning barcode: $e")),
      );
    }
  }

  void submitData() {
    // Logic to push data to Google Sheets goes here
    print("Barcode: $barcodeValue");
    print("Name: ${nameController.text}");
    print("Price: ${priceController.text}");
    print("Quantity: ${quantityController.text}");

    // Add logic to push to Google Sheets or any backend service
  }
}
