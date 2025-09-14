import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class QuizButton extends StatefulWidget {
  const QuizButton(this.text, this.size, {super.key, this.onPress});

  final VoidCallback? onPress;
  final String text;
  final double size;

  @override
  State<QuizButton> createState() {
    return _QuizButtonState();
  }
}

class _QuizButtonState extends State<QuizButton> {
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        height: 60,
        child: OutlinedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                  const Color.fromARGB(255, 117, 99, 182))),
          onPressed: widget.onPress,
          child: StyledText(widget.text, widget.size),
        ),
      ),
    );
  }
}
