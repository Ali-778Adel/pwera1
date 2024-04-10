import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedTxt extends StatelessWidget {
  final String txt;
  final String fontFamily;
  const CustomAnimatedTxt.bold({super.key,required this.txt}):fontFamily="Nunito-Bold.ttf";
  const CustomAnimatedTxt.normal({super.key,required this.txt}):fontFamily="Nunito-Regular.ttf";

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          txt,
          textStyle:  TextStyle(
              fontSize: 32.0,
              height: 2,
              fontWeight: FontWeight.bold,
              fontFamily: fontFamily),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: 1,
      pause: const Duration(milliseconds: 1000),
      // displayFullTextOnTap: true,
      // stopPauseOnTap: false,
    );
  }
}
