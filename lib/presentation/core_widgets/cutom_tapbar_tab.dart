import 'package:flutter/material.dart';

class CustomTabBarTab{

  Widget call({required BuildContext context,required String tabTxt,required Function()onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),

        child: Text(tabTxt,textAlign: TextAlign.center, style:const TextStyle(fontSize: 16,fontFamily: "Nunito-Regular.ttf"),),
      ),
    );
  }

}