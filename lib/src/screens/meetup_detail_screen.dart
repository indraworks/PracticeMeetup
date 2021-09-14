// ignore_for_file: prefer_const_constructors, prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';
import 'package:practice_meetup/src/services/meetup_api_service.dart';
//fetch meetup by id di detail_screen ambil /fetch based id dari server
//ubah dulu  stl ke stf stlahhnya update statenya krn stte hnya ada di stful

class MeetupDetailScreen extends StatefulWidget {
  static final String route = '/meetupDetail';
  final String meetupId;
  final MeetupService api = MeetupService(); //instasiate api
  //construct
  MeetupDetailScreen({required this.meetupId});

  @override
  State<MeetupDetailScreen> createState() => _MeetupDetailScreenState();
}

class _MeetupDetailScreenState extends State<MeetupDetailScreen> {
  //tmpat olah state di namaclass"state"
  initState() {
    super.initState();
    _fetchMeetup();
  }

  void _fetchMeetup() async {
    //feetchMeetupsById adalah metode dari MeetupService ,dibuat dulu trus kita panggil
    final meetup = await widget.api.fetchMeetupById(widget.meetupId);
    print(meetup.title);
    print(meetup.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Meetup Detail'),
        ),
      ),
      body: Center(
        child: Text(widget.meetupId),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

/*
jlnanya program stlah menrima argument navigator.push dari Homecreen ke detailScreen 
argument yg dibawa adalah meetup.id


*/