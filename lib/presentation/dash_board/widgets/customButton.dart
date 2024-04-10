import 'package:flutter/material.dart';

class CustomDashBoardButton extends StatelessWidget {
  final String btnTxt;
  final VoidCallback onPressed;

  const CustomDashBoardButton({super.key,required this.btnTxt,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
          alignment: Alignment.center,
          shape: MaterialStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))
          ))
        ),
        child: Text(btnTxt,style:const TextStyle(
            fontFamily: "Nunito-Regular.ttf",
            fontSize: 16,
            color: Colors.white,
          height: 1.2
        ),)
    );
  }
}
