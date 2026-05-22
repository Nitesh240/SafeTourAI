import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/map_page.dart';
import '../pages/sos_page.dart';
import '../pages/profile_page.dart';

Widget buildBottomNavBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.fixed,
    onTap: (index) {
      if (index == currentIndex) return;

      switch (index) {
        case 0:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => HomePage()));
          break;
        case 1:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => MapPage()));
          break;
        case 2:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => SosPage()));
          break;
        case 3:
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => ProfilePage()));
          break;
      }
    },
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
      BottomNavigationBarItem(icon: Icon(Icons.warning), label: "SOS"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
  );
}