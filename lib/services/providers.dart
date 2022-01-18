import 'dart:convert';
import 'dart:developer';
import 'package:enter_engineering_test/models/models.dart';
import 'package:enter_engineering_test/util/env.dart';
import 'package:http/http.dart' as http;

//Get fake posts from api
class PostProvider {
  Future<List<Post>> getPost() async {

    Uri urlString;

    urlString = Uri.http('jsonplaceholder.typicode.com', '/posts');

    log(urlString.toString());

    final responsePosts = await http.get(urlString);


    if (responsePosts.statusCode == 200) {
      List<dynamic> responsePostsJson = jsonDecode(responsePosts.body);
      return responsePostsJson.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}