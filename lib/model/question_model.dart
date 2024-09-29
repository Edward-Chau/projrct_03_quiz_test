class Question {
  Question({required this.question, required this.answer,required this.correct});

  final String question;
  final List<String> answer;
  final String correct;


   shufflelist(){
    var shuffleAnswer=List.of(answer);
    shuffleAnswer.shuffle();
    return shuffleAnswer;
  }
}
