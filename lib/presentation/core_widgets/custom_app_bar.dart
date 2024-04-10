import 'dart:js';

import 'package:flutter/material.dart';
import 'package:power/Navigations/route_delegate.dart';
import 'cutom_tapbar_tab.dart';

class CustomAppBar{
  final ScrollController scrollController;
  late  int  index;
  final MyRouteDelegate myRouteDelegate;
  final bool isLarge;
  CustomAppBar({required this.isLarge,required this.myRouteDelegate,required this.scrollController,required this.index});
  PreferredSize call(){
    return PreferredSize(
        preferredSize:const Size(double.infinity, 60),
        child: StatefulBuilder(builder: (context,setState){
          if(isLarge){
            return PreferredSize(
              preferredSize: const Size(double.infinity, 60),
              child:  Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.menu), // Your desired icon
                      onPressed: myRouteDelegate.goToDashboard),
                  const Spacer(),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: NavigationBar(
                        backgroundColor: Colors.transparent,
                        animationDuration: const Duration(milliseconds: 1000),
                        elevation: 0.0,
                        selectedIndex:index,
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        destinations: [
                          CustomTabBarTab().call(
                              context: context,
                              tabTxt: "Services",
                              onTap: () {
                                setState(() {
                                  scrollController.animateTo(
                                      scrollController.initialScrollOffset,
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeInCubic);
                                });
                              }),
                          CustomTabBarTab().call(
                              context: context,
                              tabTxt: "Products",
                              onTap: () {
                                setState(() {
                                  scrollController.animateTo(
                                      MediaQuery.of(context).size.height,
                                      duration:
                                      const Duration(milliseconds: 500),
                                      curve: Curves.easeInCirc);
                                });
                              }),
                          CustomTabBarTab().call(
                              context: context, tabTxt: "Events", onTap: () {}),
                          CustomTabBarTab().call(
                              context: context,
                              tabTxt: "Contacts",
                              onTap: () {}),
                          CustomTabBarTab().call(
                              context: context,
                              tabTxt: "About Us",
                              onTap: () {}),
                        ],
                        onDestinationSelected: (indx) {
                          setState(() {
                            index = indx;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }else{
            return  SizedBox(width:  double.infinity,height: 60,
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(padding: const EdgeInsets.all(8),
                child: IconButton(onPressed: (){}, icon:const Icon(Icons.menu,color: Colors.deepPurple,),),

              )
            ),
            );

          }
        },));
  }
}




