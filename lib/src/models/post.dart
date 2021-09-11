// ignore_for_file: prefer_initializing_formals, unnecessary_this, avoid_types_as_parameter_names, non_constant_identifier_names

class Post {
  final String title;
  final String body;
  final int id;
  Post({required String title, required String body, required int id})
      : this.title = title,
        this.body = body,
        this.id = id;

  //parse from JSON bawaan dari http library
  //masing2 di masukan ke variable dlm class dri fromat JSON
  //ke masing2 typedata(dynamic) melalu parameter parsedJson
  Post.fromJSON(Map<String, dynamic> parsedJson)
      : title = parsedJson['title'],
        body = parsedJson['body'],
        id = parsedJson['id'];
}




//eample parsing  :https://flutter.dev/docs/cookbook/networking/background-parsing