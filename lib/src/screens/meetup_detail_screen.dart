// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';

class MeetupDetailScreen extends StatelessWidget {
  static final String route = '/meetupDetail';
  final String meetupId;
  //construct
  MeetupDetailScreen({required this.meetupId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Meetup Detail'),
        ),
      ),
      body: Center(
        child: Text(meetupId),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
