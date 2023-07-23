class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    // We want to copy because shuffle changes the original list
    final copiedList = List.of(answers);
    copiedList.shuffle();
    return copiedList;
  }
}
