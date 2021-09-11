// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';
//http
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<dynamic> _post = [];
  void initState() {
    super.initState();

     //recode 
    

    http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")).
        //tampng di then ktika slsi
        then((res) {
           print(res.body);
        final posts = json.decode(res.body);
         print(posts);
          //update state
      setState(() => _post = posts);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Iam calling build!');
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Post Screen'),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
