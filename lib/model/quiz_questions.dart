class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffeledAnswers() {
    final shuffeledlist = List.of(answers); //stores a copy of the list
    shuffeledlist
        .shuffle(); //shuffel changes the original list, whicih we don't want, so we create copy of the list
    return shuffeledlist;
  }
}
//finals means u can't reassign the values