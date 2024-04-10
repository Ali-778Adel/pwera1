import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:power/Navigations/route_delegate.dart';
import 'package:power/Navigations/route_information_parser.dart';
import 'package:power/presentation/core_widgets/core_background.dart';
import 'package:power/presentation/core_widgets/cutom_tapbar_tab.dart';
import 'package:power/presentation/dash_board/dash_board_home_screen/dash_board_home_screen.dart';


final MyRouteInformationParser myRouteInformationParser = MyRouteInformationParser();
final MyRouteDelegate myRouteDelegate = MyRouteDelegate();

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: myRouteDelegate,
      routeInformationParser: myRouteInformationParser,
      title: 'PowerA1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        hoverColor: Colors.transparent,
      ),
    );
  }
}



