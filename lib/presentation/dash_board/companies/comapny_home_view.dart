import 'package:flutter/material.dart';
import 'package:power/presentation/dash_board/seperated_custom_widgets/customCreateNewElement.dart';
import 'package:power/presentation/dash_board/widgets/customButton.dart';

class CompaniesHomeView extends StatefulWidget {
  const CompaniesHomeView({super.key});

  @override
  State<CompaniesHomeView> createState() => _CompaniesHomeViewState();
}

class _CompaniesHomeViewState extends State<CompaniesHomeView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text("Companies",style:TextStyle(fontFamily: "Nunito-Bold.ttf",fontSize: 32),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(children: [
                CustomDashBoardButton(btnTxt: "create", onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)
                  =>
                  const CustomCreateNewElement(titleTxt: 'create Company')));
                }),
                const SizedBox(width: 8,),
                CustomDashBoardButton(btnTxt: "filter", onPressed: (){}),
              ],),
            ),
            const SizedBox(height: 16,),
            Table(
              textBaseline: TextBaseline.ideographic,
              children:const [
                 TableRow(
                   decoration: BoxDecoration(
                     color: Colors.grey,
                     backgroundBlendMode: BlendMode.colorDodge
                   ),
                     children: [
                   Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text("ID",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   ),
                   Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text("Active",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   ),
                   Text("TitleAr",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("TitleEn",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("CreatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("UpdatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Actions",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                ]),
                 TableRow(children: [
                   Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text("2",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   ),
                   Text("Yes",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("فويل اب ",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Fuel Up",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("CreatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("UpdatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Actions",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                ]),
                 TableRow(children: [
                   Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text("3",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   ),
                   Text("Yes",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("وطنية",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Watanya",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("CreatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("UpdatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Actions",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                ]),
                 TableRow(children: [
                   Text("4",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Yes",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("مساعادات الطريق",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("RoadSide Assist",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("CreatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("UpdatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Actions",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                ]),
                 TableRow(children: [
                   Text("5",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Yes",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("شحن كهرباء",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("electric vehicles",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("CreatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("UpdatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                   Text("Actions",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                ]),
                TableRow(children: [
                  Text("6",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                  Text("Yes",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                  Text("a1",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                  Text("a1",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                  Text("CreatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                  Text("UpdatedAt",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                  Text("Actions",style: TextStyle(fontFamily: "Nunito-Regular.ttf",fontSize: 16,height: 1.8),textAlign: TextAlign.center,),
                ]),
              ],

              border: TableBorder.all(color: Colors.black26,borderRadius: BorderRadius.circular(12)),
            ),
          ],
        ),
      ),
    );
  }
}
