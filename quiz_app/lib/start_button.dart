import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key, this.onPress});
  final VoidCallback? onPress;
  @override
  State<StartButton> createState() {
    return _StartButtonState();
  }
}

class _StartButtonState extends State<StartButton> {
  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: widget.onPress,
      icon: const Icon(Icons.arrow_forward_sharp),
      label: const StyledText('Start Quiz', 15),
    );
  }
}
