// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unused_field, prefer_const_constructors_in_immutables

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

    _fetchPost();
  }

  void _fetchPost() {
    http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")).
        //tampng di then ktika slsi
        then((res) {
      //print(res.body);
      final posts = json.decode(res.body);
      //print(posts);
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
      body: _PostList(posts: _post),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  final List<dynamic> _posts;
  //posts params yg masuk dari atas
  _PostList({required List<dynamic> posts}) : _posts = posts;
  @override
  Widget build(BuildContext context) {
    //mapping diganti dengan ListBuilder
    // return ListView(
    //   //yg kotak [ ] diganti langusng maping
    //   children: _posts
    //       .map((post) => ListTile(
    //             title: Text(post['title']),
    //             subtitle: Text(post['body']),
    //           ))
    //       .toList(),
    // );
    return ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (BuildContext context, int i) {
          return ListTile(
            title: Text(_posts[i]['title']),
            subtitle: Text(_posts[i]['body']),
          );
        });
  }
}
