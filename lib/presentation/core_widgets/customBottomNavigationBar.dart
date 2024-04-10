import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
        type: BottomNavigationBarType.shifting,
        currentIndex: currentIndex,
        onTap: (index){
        setState(() {
          currentIndex=index;
        });
        },
        items:const [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home',backgroundColor: Colors.deepPurple),
      BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits_rounded),label: 'products',backgroundColor: Colors.deepPurple),
      BottomNavigationBarItem(icon: Icon(Icons.local_gas_station),label: 'stations',backgroundColor: Colors.deepPurple),
      BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings',backgroundColor: Colors.deepPurple)
    ]);
  }
}
