import 'package:flutter/material.dart';
import 'package:seproject/events/events.dart';
import 'package:seproject/home/home_page.dart';
import 'package:seproject/search.dart';
import 'package:seproject/settings/settings.dart';
import 'package:seproject/settings/user_profile.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedPage = 0;
  final pages = [
    HomePage(),
    Events(),
    SearchSection(),
    SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.grey[200],
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.purple,
        elevation: 5.0,
        currentIndex: selectedPage,
        onTap: (int index) {
          setState(() {
            selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: "Events",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
