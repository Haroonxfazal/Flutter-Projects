import 'package:flutter/material.dart';

class EarningScreen extends StatelessWidget {
  const EarningScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start earning now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: 0.72,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Learning investition program',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A Beginner\'s Guide',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Master the basics of investing and build a solid financial foundation.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Step-by-Step',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Transform your financial goals with essential investment strategies.',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Stocks',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/stock_1.png'),
                  radius: 24.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/stock_2.png'),
                  radius: 24.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/stock_3.png'),
                  radius: 24.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/stock_4.png'),
                  radius: 24.0,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Text(
                'Show All',
                style: TextStyle(fontSize: 14.0),
              ),
            ),
            const SizedBox(height: 16.0),
            const Center(
              child: Column(
                children: [
                  Icon(Icons.arrow_upward, size: 32.0),
                  SizedBox(height: 8.0),
                  Text(
                    '\$300.00',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
