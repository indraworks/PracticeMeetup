// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/models/meetup.dart';
import 'package:practice_meetup/src/screens/MeetupHomecreen.dart';
import 'package:practice_meetup/src/screens/meetup_detail_screen.dart';

import 'package:practice_meetup/src/screens/post_screen.dart';

// kalau runing wihtoud null safety ini aja dulu
// flutter run --no-sound-null-safety //utk stiap flutter run !
void main() {
  runApp(EventMeetApp());
}

class EventMeetApp extends StatelessWidget {
  final String AppTitle = "EventMeet App";
  //const EventMeetApp({Key? key}) : super(key: key);
  // late final String id;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "this for EventMeet App",
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: "/",
        routes: {
          '/': (BuildContext context) {
            return MeetupHomeScreen();
          },
          '/meetupDetail': (BuildContext context) {
            return MeetupDetailScreen(
              meetupId: '',
            );
          }
        });
  }
}

/*
  onGenerateRoute: (RouteSettings settings) {
          if (settings.name == MeetupDetailScreen.route) {
            //final MeetupDetailArguments  arguments = settings.arguments;

            // return MaterialPageRoute(
            //     // builder: (context) => MeetupDetailScreen()
            //     builder: (context) => MeetupDetailScreen());
          }
        }



*/