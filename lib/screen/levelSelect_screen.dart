import 'package:flutter/material.dart';

class LevelSelectScreen extends StatelessWidget {
  const LevelSelectScreen(this.levelChange, {super.key});
  final void Function(String) levelChange;

  @override
  Widget build(BuildContext context) {
    final List<String> level = ["simple", "basic", "hard"];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(130.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...level.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.arrow_right_alt),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.pink[200],
                    textStyle: const TextStyle(),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    button(item);
                  },
                  label: Text(item),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  button(item) {
    levelChange(item);
  }
}
