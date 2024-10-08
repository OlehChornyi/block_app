import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:block_app/models/comments_model.dart';


class BackendService {
  String url = 'https://jsonplaceholder.typicode.com/comments';

  void fetchComments() async {
    final response = await http.get(Uri.parse(url));
     final List<dynamic> jsonData = json.decode(response.body);
       List<Comment> comments = jsonData.map((jsonItem) => Comment.fromJson(jsonItem)).toList();


    print(comments);
    comments.forEach((comment) {
    print('Comment: ${comment.name}, by ${comment.email}');
  });
  }
}
