// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/screens/meetup_detail_screen.dart';
import 'package:practice_meetup/src/screens/meetup_home_screen.dart';
import 'package:practice_meetup/src/screens/post_screen.dart';

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
        //buat route
        // routes: {"/meetupDetail": (context) => MeetupDetailScreen()},
        //declrate dulu  var route di meetDetall
        routes: {MeetupDetailScreen.route: (context) => MeetupDetailScreen()},
        // home: HomeScreen(title: AppTitle)
        home: PostScreen());
  }
}
