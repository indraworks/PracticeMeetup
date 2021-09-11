// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unused_field, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, unused_local_variable, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/models/post.dart';
import 'package:practice_meetup/src/services/post_api_provider.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';

//http
import 'package:http/http.dart' as http;
import "package:faker/faker.dart";

class PostScreen extends StatefulWidget {
  //instansiate  obj _api dri class PostApiProvider

  final PostApiProvider _api = PostApiProvider();

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> _posts = [];
  @override
  void initState() {
    super.initState();

    _fetchPost();
  }

  _fetchPost() async {
    List<Post> posts = await widget._api.fetchPosts();
    setState(() => _posts = posts);
  }

  //adding post pake faker
  _addPost() {
    final id = faker.randomGenerator.integer(999);
    final title = faker.food.dish();
    final body = faker.food.cuisine();
    final newPost = Post(title: title, body: body, id: id);
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
      body: _PostList(posts: _posts),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addPost,
        tooltip: 'Add Post',
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  final List<Post>? _posts;
  //posts params yg masuk dari atas
  _PostList({required List<Post> posts}) : _posts = posts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _posts!.length * 2,
        itemBuilder: (BuildContext context, int i) {
          //tiap baris ganjil divider muncul
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          //posts sudah dl bntuk obj
          return ListTile(
            title: Text(_posts![index].title),
            subtitle: Text(_posts![index].body),
          );
        });
  }
}
