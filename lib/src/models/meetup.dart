// ignore_for_file: unnecessary_this

import 'package:practice_meetup/src/models/category.dart';

class Meetup {
  final String id;
  final String proccessedLocation;
  final String location;
  final String title;
  final String image;
  final String description;
  final String shortInfo;
  final Category category;
  final String startDate;
  final String timeFrom;
  final String timeTo;
  final String createdAt;
  final String updateAt;
  int joinedPeopleCount;
  // final User meetupCreator;
  // final List<User> joinedPeople;

  Meetup.fromJSON(Map<String, dynamic> parsedJson)
      : this.id = parsedJson['_id'],
        this.proccessedLocation = parsedJson['proccessedLocation '] ?? '',
        this.location = parsedJson['location'] ?? '',
        this.title = parsedJson['title'] ?? '',
        this.image = parsedJson['image'] ?? '',
        this.description = parsedJson['description'] ?? '',
        this.shortInfo = parsedJson['shortInfo'] ?? '',
        this.startDate = parsedJson['startDate'] ?? '',
        this.timeFrom = parsedJson['timeFrom'] ?? '',
        this.timeTo = parsedJson['timeTo'] ?? '',
        this.joinedPeopleCount = parsedJson['joinedPeopleCount'] ?? 0,
        this.createdAt = parsedJson['createdAt'] ?? '',
        this.updateAt = parsedJson['updateAt'] ?? '',
        this.category = Category.fromJSON(parsedJson['category'] ?? '');
  //this.meetupCreator =
  //this.joindedPeople =
}
