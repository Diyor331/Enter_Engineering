import 'dart:developer';

import 'package:enter_engineering_test/models/models.dart';
import 'package:enter_engineering_test/services/providers.dart';

class PostsRepository {
  final PostProvider _postProvider = PostProvider();

  Future<List<Post>> getAllPosts() {
    log( _postProvider.getPost().toString());
    return _postProvider.getPost();
  }
}