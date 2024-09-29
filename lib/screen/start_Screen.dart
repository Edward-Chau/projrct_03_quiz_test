import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projrct_03_test/model/ETAcolors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.levelChageButton, super.key});

  final void Function() levelChageButton;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HomeScreenImage(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Text(
              "Wellcome!",
              style: GoogleFonts.protestGuerrilla(
                textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
          TextButton.icon(
            icon: const Icon(Icons.play_arrow),
            onPressed: levelChageButton,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(197, 255, 255, 255),
              backgroundColor: EtaColors.backGroundColor_1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            label: const Text(
              "Start!",
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}

class HomeScreenImage extends StatelessWidget {
  const HomeScreenImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Image.asset(
        "assets/images/quiz-logo.png",
        width: 200,
        color: const Color.fromARGB(100, 255, 255, 255),
      ),
    );
  }
}
