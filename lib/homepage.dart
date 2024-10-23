import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TodaySalesCard(),
            SizedBox(height: 20),
            Text(
              "Cashier Sales",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CashierSalesChart(),
            SizedBox(height: 20),
            Text(
              "Top 5 Selling Products",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TopSellingProductsList(), // Updated to use the new list
          ],
        ),
      ),
    );
  }
}

class TodaySalesCard extends StatelessWidget {
  const TodaySalesCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for cash money, Mpesa, and profit
    final int cashMoney = 800; // Example cash money amount
    final int mpesa = 400; // Example Mpesa amount
    final int totalCollected = cashMoney + mpesa; // Total money collected
    final int profit = 500; // Example profit amount

    return Card(
      elevation: 5,
      color: Colors.green[100], // Light green background
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Today's Sales",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[800]),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("Items Sold", style: TextStyle(fontSize: 16, color: Colors.green[800])),
                    Text("150", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900])),
                  ],
                ),
                Column(
                  children: [
                    Text("Cash Money", style: TextStyle(fontSize: 16, color: Colors.green[800])),
                    Text("Ksh $cashMoney", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900])),
                  ],
                ),
                Column(
                  children: [
                    Text("Mpesa", style: TextStyle(fontSize: 16, color: Colors.green[800])),
                    Text("Ksh $mpesa", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900])),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Total Collected", style: TextStyle(fontSize: 16, color: Colors.green[800])),
                    Text("Ksh $totalCollected", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900])),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20), // Space before the profit row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text("Profit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[800])),
                    Text("Ksh $profit", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.green[900])),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CashierSalesChart extends StatelessWidget {
  const CashierSalesChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              radius: 65,
              value: 400,
              title: 'Esther: \$400',
              color: Colors.blue,
            ),
            PieChartSectionData(
              radius: 65,
              value: 300,
              title: 'Jane: \$300',
              color: Colors.green,
            ),
            PieChartSectionData(
              radius: 65,
              value: 500,
              title: 'Doris: \$500',
              color: Colors.red,
            ),
          ],
          borderData: FlBorderData(show: false),
          centerSpaceRadius: 40,
        ),
      ),
    );
  }
}

class TopSellingProductsList extends StatelessWidget {
  const TopSellingProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for the top selling products
    final List<Map<String, dynamic>> products = [
      {"name": "Kinagop Milk", "sold": 50},
      {"name": "Butter Toast bread", "sold": 40},
      {"name": "Bakers flour", "sold": 30},
      {"name": "Elianto Oil", "sold": 20},
      {"name": "Kahawa No 1", "sold": 10}
    ];

    return ListView.builder(
      shrinkWrap: true, // Allows the ListView to take only the space it needs
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  products[index]["name"],
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${products[index]["sold"]} sold",
                  style: TextStyle(fontSize: 16 , color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}