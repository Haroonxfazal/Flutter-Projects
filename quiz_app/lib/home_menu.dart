import 'package:flutter/material.dart';

import 'package:quiz_app/start_button.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key, this.onPress});

  final VoidCallback? onPress;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          height: 200,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(height: 20),
        const SizedBox(height: 50),
        Text(
          'Learn Flutter The Fun Way!',
          style: GoogleFonts.lato(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        StartButton(onPress: onPress),
      ],
    );
  }
}
