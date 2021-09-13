// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/screens/MeetupHomecreen.dart';
import 'package:practice_meetup/src/screens/meetup_detail_screen.dart';
import 'package:practice_meetup/src/screens/meetup_home_screen.dart';
import 'package:practice_meetup/src/screens/post_screen.dart';

// kalau runing wihtoud null safety ini aja dulu
// flutter run --no-sound-null-safety //utk stiap flutter run !
void main() {
  runApp(EventMeetApp());
}

class EventMeetApp extends StatelessWidget {
  final String AppTitle = "EventMeet App";
  const EventMeetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "this for EventMeet App",
      theme: ThemeData(primarySwatch: Colors.blue),
      // old
      //buat route
      // routes: {"/meetupDetail": (context) => MeetupDetailScreen()},
      //declrate dulu  var route di meetDetall
      // routes: {MeetupDetailScreen.route: (context) => MeetupDetailScreen()},
      //end old

      home: MeetupHomeScreen(),
      //Generate Route
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) => MeetupDetailScreen());
      },
    );
  }
}
