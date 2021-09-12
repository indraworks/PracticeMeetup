// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, unused_field, prefer_const_constructors_in_immutables, unnecessary_brace_in_string_interps, unused_local_variable, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practice_meetup/src/models/post.dart';
import 'package:practice_meetup/src/services/post_api_provider.dart';
import 'package:practice_meetup/src/widgets/BottomNavigation.dart';

//http
import 'package:http/http.dart' as http;
import "package:faker/faker.dart";
//note final inheirted

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
    //update state!
    setState(() => _posts.add(newPost));
  }

  @override
  Widget build(BuildContext context) {
    //return ke constructor _interitedPost
    return _InheritedPost(
        posts: _posts, createPost: _addPost, child: _PostList());
    // child: _PostList(posts: _posts, createPost: _addPost));
  }
}

//mmbuat inheritedWidget yg merupakan anak dari  widget _PostScreenState

class _InheritedPost extends InheritedWidget {
  //const InheritedPost({ Key? key }) : super(key: key);
  final Widget child;
  final List<Post> posts;
  final Function createPost;
  _InheritedPost(
      {required this.child, required this.posts, required this.createPost})
      : super(child: child);

  @override
  //notify widget child dibawah ny ajika ada perubahan _PostList
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
  //pake static trus pake of(BuildContext context)
  static _InheritedPost? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedPost>();
  }
  /*
   static Name of(BuildContext context) {
  return context.dependOnInheritedWidgetOfExactType<Name>();  //here
}
  */
}

class _PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //maksudnya posts yg fisini adalah sama dgn yg punya posts diatas _InheritedPost
    // old:final posts = (context.dependOnInheritedWidgetOfExactType<_InheritedPost>()
    //       as _InheritedPost).posts;

    //new way:
    final posts = _InheritedPost.of(context)?.posts;

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Post Screen'),
          ),
        ),
        body: ListView.builder(
            itemCount: posts?.length * 2,
            itemBuilder: (BuildContext context, int i) {
              //tiap baris ganjil divider muncul
              if (i.isOdd) {
                return Divider();
              }
              final index = i ~/ 2;
              //posts sudah dl bntuk obj
              return ListTile(
                title: Text(posts[index].title),
                subtitle: Text(posts[index].body),
              );
            }),
        bottomNavigationBar: BottomNavigation(),
        floatingActionButton: _PostButton());
  }
}

class _PostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _InheritedPost.of(context).createPost,
      tooltip: 'Add Post',
    );
  }
}

/*
ktika kita pindahin scafol kebawah dan return adalah kosong dan diisi dngn 
return _PostList(posts: _posts);
maka kalo kita tekan tombol onPressed: () {}, ini masih kosong dan cara gimana?
isi apa??
caranya kita harus buat constructor di _PostList sbb:
1) nah buat passing parameter utk function _addPost   dibagian return yg ada di class PostScreen ( yaitu di statenya class _PostScreenState)
   sbb: return _PostList(posts: _posts,  createPost:_addPost);
   ini supaya bisa masuk di class _PostList 

2) nah diclass _PostList di constructornya kita pasang parameter karna yg masuk  type function 
   maka declare dulu  var local bertye functuon sbb:final Function createPost
   dan di construcroer pasang parameert fucntion nya :

class _PostList extends StatelessWidget ({ 
     required this.createPost
  }): _posts = posts;

  //cara diatas gak jalan masih error utk onPress:createPost 
  utk itu akalinya dgn inheritedWidget  sbb diaas caranya 
  stlahnya kita nnti pakai cara 
  inherited widget 
  library scopedmodel(next lecture)

*/

/*jalanya program dari atas ini berkisah inheritedwidget diatas:
 pada  class PostScreen extends StatefulWidget :
      kita ada data _posts = []
      kit afetch kmudian tampung smua jason kedalam list diatas _posts = []
      berdasarkan field2 yg ada ddi Pist model 
      2. addPost() ini functionutk tambah data nah data didapat dari faker
          ini dlm bntuk library gak perlu lagi http
      3. datanya yg add tadi harus bisa ampil discreen
          utk itu kita punya widgte inheiredPost  kita pasing di constructornya
           return _InheritedPost(
                   posts: _posts, createPost: _addPost, child: _PostList());

     3) di class _InheritedPost extends InheritedWidget 
        kita buat consructornya :
        _InheritedPost(
      {required this.child, required this.posts, required this.createPost})
      : super(child: child);
       
       danjang lupa notify ke anak widgetnya dalma hal ini _PostList widget 
       mmberi notify jia ada update disini pada child widget postList
             @override
             bool updateShouldNotify(InheritedWidget oldWidget) => true;  
         


*/

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
