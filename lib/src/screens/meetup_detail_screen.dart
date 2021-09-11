// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';

class MeetupDetailScreen extends StatelessWidget {
  static final String route = '/meetupDetail';

  const MeetupDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Meetup Detail'),
        ),
      ),
      body: Center(
        child: Text('im meetup detail screen'),
      ),
    );
  }
}
