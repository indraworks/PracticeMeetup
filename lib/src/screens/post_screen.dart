// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unused_field, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/models/post.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';
//http
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  // List<dynamic> _post = []; chage dari class Post model
  List<Post> _posts = [];
  void initState() {
    super.initState();

    _fetchPost();
  }

  void _fetchPost() {
    http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")).
        //tampng di then ktika slsi
        then((res) {
      // final posts = json.decode(res.body);
      //dri json yg diambil valuenya saja
      final List<dynamic> parsedPosts = json.decode(res.body);
      //print("ini parsedPosts :${parsedPosts}");
      final posts =
          parsedPosts.map((parsePost) => Post.fromJSON(parsePost)).toList();
      print("bentuk posts body index 1 = ${posts[1].body}");
      //update state
      setState(() => _posts = posts);
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
      body: _PostList(posts: _posts),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  final List<Post> _posts;
  //posts params yg masuk dari atas
  _PostList({required List<Post> posts}) : _posts = posts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _posts.length * 2,
        itemBuilder: (BuildContext context, int i) {
          //tiap baris ganjil divider muncul
          if (i.isOdd) {
            return Divider();
          }
          final index = i ~/ 2;
          //posts sudah dl bntuk obj
          return ListTile(
            title: Text(_posts[index].title),
            subtitle: Text(_posts[index].body),
          );
        });
  }
}

/*
catatatn bentuk parsePosts:
ini parsedPosts :[{userId: 1, id: 1, title: sunt aut facere repellat provident 
occaecati excepturi optio reprehenderit, body: quia et suscipit
 suscipit recusandae consequuntur expedita et cum
 }, 
 {userId: 1, id: 2, title: qui est esse, body: est rerum tempore vitae
 }
 ...]

nah betuk dari Posts sudah bentuk object krn kita kan udah buat Post Model 
berbentuk Object dan hasil parese Json tadi diconvert dimasukan kesini permasing
object listeralnya jadi kalao mau panggil per objecta literal atau anaknya 
Posts.title,
Pusts.body
jadi sprti ini manggilnya :
/flutter (25820): bentuk posts body index 1 = est rerum tempore vitae
I/flutter (25820): sequi sint nihil reprehenderit dolor beatae ea dolores neque
I/flutter (25820): fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis
I/flutter (25820): qui aperiam non debitis possimus qui neque nisi nulla

*/
