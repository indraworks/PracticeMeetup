// ignore_for_file: file_names, deprecated_member_use, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  //const BottomNavigation({ Key? key }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },

      // ignore: prefer_const_literals_to_create_immutables
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Profile')),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), title: Text('Settings')),
      ],
    );
  }
}
