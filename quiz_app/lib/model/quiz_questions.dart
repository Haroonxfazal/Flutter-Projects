class QuizQuestions {
  const QuizQuestions(this.question, this.answers);

  final String question;
  final List<String> answers;

  List<String> getShuffledList() {
    final List<String> shuffledList = List.from(answers);

    shuffledList.shuffle();
    return shuffledList;
  }
}
