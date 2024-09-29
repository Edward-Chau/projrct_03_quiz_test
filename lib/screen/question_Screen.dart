import 'package:flutter/material.dart';
import 'package:projrct_03_test/model/ETAcolors.dart';
import 'package:projrct_03_test/model/question_model.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.questionList, this.addAnwser, {super.key});
  final List<Question> questionList;
  final Function(String) addAnwser;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    Question currentList = widget.questionList[questionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                currentList.question,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentList.shufflelist().map(
                  (item) => QuestionButton(item, () {
                    click(item);
                  }),
                ),
          ],
        ),
      ),
    );
  }

  // void x() {click(item);}

  void click(String item) {
    widget.addAnwser(item);
    setState(() {
      questionIndex++;
    });
  }
}

class QuestionButton extends StatelessWidget {
  const QuestionButton(this.anwer, this.click, {super.key});
  final String anwer;
  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: TextButton(
        onPressed: click,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: EtaColors.backGroundColor_1,
        ),
        child: Text(
          anwer,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
