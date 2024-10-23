import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class BarcodeScannerLogic {
  String barcodeValue = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController buyingPriceController = TextEditingController(); // New controller for buying price
  TextEditingController sellingPriceController = TextEditingController(); // New controller for selling price
  TextEditingController quantityController = TextEditingController();
  bool isScanned = false; // Track if the barcode has been scanned

  // Function to scan barcode using the camera
  Future<void> scanBarcode(BuildContext context) async {
    try {
      // Use barcode_scan2 to scan a barcode
      var result = await BarcodeScanner.scan();
      if (result.rawContent.isNotEmpty) {
        barcodeValue = result.rawContent; // Save the scanned barcode value
        isScanned = true; // Set the state to indicate that barcode is scanned

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Barcode Scanned: $barcodeValue")),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error scanning barcode: $e")),
      );
    }
  }

  void submitData() {
    // Logic to submit data goes here
    print("Barcode: $barcodeValue");
    print("Name: ${nameController.text}");
    print("Buying Price: ${buyingPriceController.text}"); // Print buying price
    print("Selling Price: ${sellingPriceController.text}"); // Print selling price
    print("Quantity: ${quantityController.text}");
    
    // Add logic to handle the data, e.g., send to a server or store locally
  }
}