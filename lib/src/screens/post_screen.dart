// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unused_field, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, unused_local_variable, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:practice_meetup/src/scoped_model/post_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';

//http
import 'package:http/http.dart' as http;
import "package:faker/faker.dart";
//note final inheirted

class PostScreen extends StatefulWidget {
  //instansiate  obj _api dri class PostApiProvider

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    //delete smua ganti pake scoped model
    return ScopedModel<PostModel>(model: PostModel(), child: _PostList());
  }
}

//inherited post dihapus gak pake! karena udah pake scoped model

class _PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PostModel>(
      builder: (context, _, model) {
        final posts = model.posts;
        return Scaffold(
          body: ListView.builder(
            itemCount: posts.length * 2,
            itemBuilder: (BuildContext context, int i) {
              if (i.isOdd) {
                return Divider();
              }

              final index = i ~/ 2;

              return ListTile(
                  title: Text(posts[index].title),
                  subtitle: Text(posts[index].body));
            },
          ),
          bottomNavigationBar: BottomNavigation(),
          floatingActionButton: _PostButton(),
          appBar: AppBar(title: Text(model.testingState)),
        );
      },
    );
  }
}

class _PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //buatnya dibwah widget buildContext
    final postModel = ScopedModel.of<PostModel>(context, rebuildOnChange: true);
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: postModel.addPost,
      tooltip: 'Add Post',
    );
  }
}



/*Inherited Widget apa itu? jadi ini gak pake library penggambarannya adalah 
 jika ada widget root atau parent dia declare sbgai inheritedwidget ( artinya widget saya ini bisa diturunkan 
 kepada anak2 widget saya 
 )
 PostScreen
 |
 |
 InheritedPost  addPost
                posts     
 |                       |
 |                       |
 PostList                |
 |                      dipakai/diturnkan dari atas
 |                       |
 PostButton     addPost  |


*/
