import 'package:flutter/material.dart';
import 'package:projrct_03_test/model/question_model.dart';

class Resultscreen extends StatelessWidget {
  Resultscreen(this.homeButton, this.questionList, this.userAnser, {super.key});

  final void Function() homeButton;
  final List<Question> questionList;
  final List userAnser;
  var correct = 0;

  int get indel {
    for (var i = 0; i < userAnser.length; i++) {
      if (userAnser[i] == questionList[i].correct) {
        correct++;
      }
    }
    return correct;
  }

  @override
  Widget build(BuildContext context) {
    int questionLength = questionList.length;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "You answered $indel out of $questionLength question correctly!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            for (var i = 0; i < userAnser.length; i++)
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      (i + 1).toString(),
                    ),
                  ),
                  title: Text(
                    questionList[i].question,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(questionList[i].correct),
                      ),
                      Text(userAnser[i]),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: HomeButton(homeButton),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  const HomeButton(this.homeButton, {super.key});

  final void Function() homeButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: homeButton,
      icon: const Icon(Icons.home),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(30.0),
          ),
          foregroundColor: const Color.fromARGB(255, 95, 95, 95)),
      label: const Text("Home"),
    );
  }
}
