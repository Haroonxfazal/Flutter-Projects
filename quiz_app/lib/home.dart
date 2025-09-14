import 'package:flutter/material.dart';
import 'package:quiz_app/home_menu.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.onPress});

  final VoidCallback? onPress;
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 223, 214),
            Color.fromARGB(255, 227, 165, 199),
            Color.fromARGB(255, 182, 146, 194),
            Color.fromARGB(255, 105, 79, 142)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: HomeMenu(onPress: onPress),
      ),
    );
  }
}
