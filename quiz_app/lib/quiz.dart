import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/quiz_screens.dart';

class Quiz extends StatefulWidget {
  const Quiz({this.onPress, super.key});
  final VoidCallback? onPress;
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = Home(onPress: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuizScreens();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen,
      ),
    );
  }
}
