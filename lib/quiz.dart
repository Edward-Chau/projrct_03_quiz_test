import 'package:flutter/material.dart';
import 'package:projrct_03_test/model/ETAcolors.dart';
import 'package:projrct_03_test/model/question_model.dart';
import 'package:projrct_03_test/screen/resultScreen.dart';
import 'package:projrct_03_test/screen/start_Screen.dart';
import 'package:projrct_03_test/screen/levelSelect_screen.dart';
import 'package:projrct_03_test/screen/question_Screen.dart';
import 'package:projrct_03_test/question_list/basic.dart';
import 'package:projrct_03_test/question_list/simple.dart';
import 'package:projrct_03_test/question_list/hard.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Question> qutionList = []; //儲存該難度的列表
  List<String> userAnswer = [];

  userAnser(item) {
    userAnswer.add(item);
    print(userAnswer);
    if (qutionList.length == userAnswer.length) {
      setState(
        () {
          screen = "resultScreen";
        },
      );
    }
  }

  void homeScreenStartButton() {
    setState(
      () {
        screen = "LevelSelectScreen";
      },
    );
  }

  levelScreenButton(level) {
    if (level == "simple") {
      qutionList = simpleQuestion;
    }
    if (level == "basic") {
      qutionList = basicQuestion;
    }
    if (level == "hard") {
      qutionList = hardQuestion;
    }

    setState(() {
      screen = "questionScreen";
    });
  }

  void homeButton() {
    qutionList = [];
    userAnswer = [];
    setState(() {
      screen = "StartScreen";
    });
  }

  String screen = "StartScreen";
  Widget? activeScreen;

  @override
  Widget build(BuildContext context) {
    if (screen == "StartScreen") {
      activeScreen = StartScreen(levelChageButton: homeScreenStartButton);
    }
    if (screen == "LevelSelectScreen") {
      activeScreen = LevelSelectScreen(levelScreenButton);
    }
    if (screen == "questionScreen") {
      activeScreen = QuestionScreen(qutionList, userAnser);
    }
    if (screen == "resultScreen") {
      activeScreen = Resultscreen(homeButton, qutionList, userAnswer);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                EtaColors.backGroundColor_1,
                EtaColors.backGroundColor_2,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
