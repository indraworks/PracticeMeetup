import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:practice_meetup/src/models/post.dart';

class PostApiProvider {
  //declare singleton
  static final PostApiProvider _objsingleton = PostApiProvider._internal();
  factory PostApiProvider() => _objsingleton;
  PostApiProvider._internal();

  Future<List<Post>> fetchPosts() async {
    final res =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    final List<dynamic> parsedPosts = json.decode(res.body);

    return parsedPosts
        .map((parsePost) => Post.fromJSON(parsePost))
        .take(2)
        .toList();
  }

  /*
   old gak pake singleTon
   class PostApiProvider {

  //mrupakan method  kmbalian brupa Future dgn array/list yg bertipe format obj Post Model
  Future<List<Post>> fetchPosts() async {
    
   final res = await  http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
   final List<dynamic> parsedPosts = json.decode(res.body);
    
   return  parsedPosts.map((parsePost) => Post.fromJSON(parsePost)).toList();
      //print("bentuk posts body index 1 = ${posts[1].body}");
      //update state
    
  }



  */

}
