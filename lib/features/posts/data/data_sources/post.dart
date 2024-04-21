import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nagdy_app/features/posts/data/models/api_model.dart';

class PostRemoteDataSource {
  Future<List<Apiposts>> fetchPosts(int limit, int skip) async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/posts?skip=$skip&limit=$limit'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<Apiposts> posts = [];
      for (var element in data['posts']) {
        posts.add(Apiposts.fromJson(element));
      }
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
