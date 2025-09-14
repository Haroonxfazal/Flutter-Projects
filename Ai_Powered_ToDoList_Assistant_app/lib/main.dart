import 'package:flutter/material.dart';
import 'package:test/cards_screen.dart';
import 'package:test/earning_screen.dart';
import 'package:test/overview_screen.dart';

void main() {
  runApp(const Banking_App());
}

class Banking_App extends StatelessWidget {
  const Banking_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CardsScreen(),
        '/earning': (context) => const EarningScreen(),
        '/overview': (context) => OverviewScreen(),
      },
    );
  }
}
