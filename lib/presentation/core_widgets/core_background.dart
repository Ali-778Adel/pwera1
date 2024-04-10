import 'dart:ui';

import 'package:flutter/material.dart';

class CoreBackground extends StatelessWidget {
  const CoreBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                color:const Color(0xffffffff),
                // child: Image.asset('dots.png', fit: BoxFit.fill),
              ),
            )),
        Positioned(
            top: -20,
            left: -20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF234D10).withOpacity(80 / 100),
              ),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height * .350,
            left: MediaQuery.of(context).size.width * .30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF9B750).withOpacity(80 / 100),
              ),
            )),
        Positioned(
            top: 160,
            right: 28,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF9B750).withOpacity(80 / 100),
              ),
            )),
        Positioned(
            bottom: MediaQuery.of(context).size.height * .10,
            right: MediaQuery.of(context).size.width * .33,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF234D10).withOpacity(80 / 100),
              ),
            )),
        Positioned(
            bottom: MediaQuery.of(context).size.height * .120,
            right: MediaQuery.of(context).size.width * .250,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF234D10).withOpacity(80 / 100),
              ),
            )),
        Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 70, sigmaY: 100),
              child: Container(
                color: Color(0xffFEF8F),
              ),
            )),
        Positioned.fill(child: Image.asset('dots.png', fit: BoxFit.fill)),
      ],
    );
  }
}
