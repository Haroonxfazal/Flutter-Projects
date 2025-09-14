import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/styled_text.dart';
import 'package:quiz_app/model/quiz_questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.questions});

  final List<String> chosenAnswers;
  final List<QuizQuestions> questions;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'questionIndex': i,
          'question': questions[i].question,
          'correct_Answer': questions[i].answers[0],
          'user_Answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final int totalQuestions = chosenAnswers.length;

    final List<Map<String, Object>> summary = getSummaryData();
    final int correctAnswers = summary.where((item) {
      return item['correct_Answer'] == item['user_Answer'];
    }).length;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 223, 214),
              Color.fromARGB(255, 227, 165, 199),
              Color.fromARGB(255, 182, 146, 194),
              Color.fromARGB(255, 105, 79, 142),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $totalQuestions questions correctly',
              style: GoogleFonts.abrilFatface(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            QuestionsSummary(getSummaryData()),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(5),
              child: SizedBox(
                width: 200, // Adjust the width as needed
                height: 50, // Adjust the height as needed
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 117, 99, 182),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Quiz()),
                    );
                  },
                  child: const StyledText('Restart Quiz', 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
