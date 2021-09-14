// ignore_for_file: unused_local_variable, avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert'; //json convert
import 'dart:io' show Platform; //pilhan? ios:droid

import 'package:practice_meetup/src/models/meetup.dart';

class MeetupService {
  //isntansiate dgn statuic dari constructor MeetupService
  static final MeetupService _singleton = MeetupService._internal();
  //constructor pake factory
  factory MeetupService() {
    return _singleton;
  }

  MeetupService._internal();

  //Platform
  // final String url = Platform.isIOS
  //     ? 'http://localhost:3001/api/v1'
  //     : 'http://10.0.2.2:3001/api';
  final String url = Platform.isIOS
      ? 'http://localhost:3001/api/v1'
      : 'http://10.0.2.2:3001/api/v1';
  //fecth data meetup from server
  Future<List<Meetup>> fetchMeetups() async {
    final res = await http.get(Uri.parse('$url/meetups')); //nodejs server
    print(res);
    final List parsedMeetups = json.decode(res.body);
    //maping ke List ambil valuenya
    return parsedMeetups.map((item) => Meetup.fromJSON(item)).toList();
  }

  //fecth data by Id Meetup from server
  Future<Meetup> fetchMeetupById(String id) async {
    final res = await http.get(Uri.parse('$url/meetups/$id'));
    final parseMeetupId = json.decode(res.body);
    return Meetup.fromJSON(parseMeetupId);
  }
}
