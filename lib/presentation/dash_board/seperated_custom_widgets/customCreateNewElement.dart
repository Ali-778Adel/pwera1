import 'package:flutter/material.dart';
import 'package:power/presentation/core_widgets/core_background.dart';
import 'package:power/presentation/dash_board/seperated_custom_widgets/custom_animated_text.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import '../widgets/customButton.dart';

class CustomCreateNewElement extends StatefulWidget {
  final String titleTxt;
  const CustomCreateNewElement({super.key,required this.titleTxt});

  @override
  State<CustomCreateNewElement> createState() => _CustomCreateNewElementState();
}

class _CustomCreateNewElementState extends State<CustomCreateNewElement> {
  bool switcherState=false;
  late ValueNotifier<bool> _switcherController;

  @override
  void initState() {
    _switcherController=ValueNotifier<bool>(switcherState);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       const CoreBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAnimatedTxt.bold(txt: widget.titleTxt),
                const SizedBox(height: 24,),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Text("Active",style: TextStyle(fontSize: 16,fontFamily: "Nunito-Bold.ttf"),),
                    const SizedBox(width: 4,),
                    AdvancedSwitch(
                      controller: _switcherController,
                      activeColor: Colors.deepPurple,
                      inactiveColor: Colors.white,
                      borderRadius:const BorderRadius.all( Radius.circular(15)),
                      width: 50.0,
                      height: 30.0,
                      enabled: true,
                      disabledOpacity: 0.5,
                      onChanged: (val){
                        setState(() {
                          switcherState=val;
                        });
                      },
                    )
                  ],

                ),
               const SizedBox(height: 24,),
               const CustomFormField(labelTxt: "Title EN",),
                const SizedBox(height: 24,),
               const CustomFormField(labelTxt: "Title Ar",),
                const SizedBox(height: 24,),
               const CustomFormField(labelTxt: "Slug",),
                const SizedBox(height: 32,),
                Wrap(children: [
                  CustomDashBoardButton(btnTxt: 'Create',onPressed: (){},),
                 const SizedBox(width: 8,),
                  CustomDashBoardButton(btnTxt: 'Cancel',onPressed: (){},),
                ],)

              ],
            ),
          ),
        )
      ],
    );
  }
}

class CustomFormField extends StatelessWidget {
  final String labelTxt;
  const CustomFormField({super.key,required this.labelTxt});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelTxt,style:const TextStyle(fontFamily: "Nunito-Bold.ttf",fontSize: 16),),
        Container(

          decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow:  [
              BoxShadow(offset:const Offset(4,0),
                color:  Colors.deepPurple.withOpacity(20 / 100),
                blurRadius: 20,
                spreadRadius: 2
              )
            ]
          ),
          child: FormField(builder: (ctx){
            return TextFormField(
              decoration: InputDecoration(
                 fillColor: Colors.white,
                 focusColor:Colors.white ,
                hintText:labelTxt,
                  border:const OutlineInputBorder(

                 borderSide: BorderSide(color: Colors.grey),
                 borderRadius: BorderRadius.all(Radius.circular(15))
               ),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*.90)
              ),
            );

          }),
        ),
      ],
    );
  }
}

