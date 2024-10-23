import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {
  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  List<Map<String, dynamic>> stockItems = [
    {
      'name': 'Unga wa Dola',
      'buyingPrice': 100,
      'sellingPrice': 120,
      'quantity': 50
    }, // Maize flour
    {
      'name': 'Safari Soap',
      'buyingPrice': 60,
      'sellingPrice': 80,
      'quantity': 100
    }, // Soap
    {
      'name': 'KCC Milk',
      'buyingPrice': 50,
      'sellingPrice': 60,
      'quantity': 200
    }, // Milk
    {
      'name': 'Jumia Rice',
      'buyingPrice': 130,
      'sellingPrice': 150,
      'quantity': 150
    }, // Rice
    {
      'name': 'Dettol Antiseptic',
      'buyingPrice': 80,
      'sellingPrice': 100,
      'quantity': 120
    }, // Antiseptic
    // Add more items here
  ];

  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = stockItems; // Initially display all items
  }

  void _filterItems(String query) {
    final filtered = stockItems.where((item) {
      final nameLower = item['name'].toLowerCase();
      final searchLower = query.toLowerCase();
      return nameLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredItems = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Search items',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onChanged: _filterItems, // Update list based on search query
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Card(
                  elevation: 8,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'S.P : KES ${item['sellingPrice']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              'B.P : KES ${item['buyingPrice']}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8), // Space between the row and quantity
                        Center(
                          child: Text(
                            'Quantity: ${item['quantity']}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}