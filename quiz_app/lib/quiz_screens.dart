import 'package:flutter/material.dart';
import 'package:quiz_app/model/quiz_questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/quiz_button.dart';
import 'package:quiz_app/data/question_answers_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreens extends StatefulWidget {
  const QuizScreens({super.key});

  @override
  State<QuizScreens> createState() {
    return _QuizScreensState();
  }
}

class _QuizScreensState extends State<QuizScreens> {
  int iterator = 0;
  QuizQuestions? currentQuestion;
  List<String> selectedAnswer = [];

  @override
  void initState() {
    currentQuestion = questions[iterator];
    super.initState();
  }

  void optionPress(String value) {
    chooseAnswer(value);
    setState(() {
      if (iterator < questions.length - 1) {
        iterator += 1;
        currentQuestion = questions[iterator];
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ResultsScreen(
                      chosenAnswers: selectedAnswer,
                      questions: questions,
                    )));
      }
      // currentQuestion = questions[iterator];
    });
  }

  void chooseAnswer(String value) {
    selectedAnswer.add(value);
  }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 255, 223, 214),
        Color.fromARGB(255, 227, 165, 199),
        Color.fromARGB(255, 182, 146, 194),
        Color.fromARGB(255, 105, 79, 142)
      ])),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                currentQuestion!.question,
                style: GoogleFonts.lato(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ...currentQuestion!.getShuffledList().map((item) {
                return QuizButton(item, 20, onPress: () {
                  optionPress(item);
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
