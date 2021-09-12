// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class MeetupHomeScreen extends StatefulWidget {
  const MeetupHomeScreen({Key? key}) : super(key: key);

  @override
  _MeetupHomeScreenState createState() => _MeetupHomeScreenState();
}

class _MeetupHomeScreenState extends State<MeetupHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text("Home"),
        )),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
              child: Text("iam MettupScreen Home"),
            ),
          ],
        ));
  }
}
