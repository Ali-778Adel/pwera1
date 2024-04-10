import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  const CustomListTile({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      onTap: () {
        print("listile tapped");
      },
      titleAlignment: ListTileTitleAlignment.center,
      leading: const SizedBox(
        width: 8,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      title: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            title,
            textStyle: const TextStyle(
                fontSize: 20.0,
                height: 1,
                fontWeight: FontWeight.normal,
                fontFamily: "Nunito-Regular.ttf"),
            speed: const Duration(milliseconds: 100),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 1000),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }
}