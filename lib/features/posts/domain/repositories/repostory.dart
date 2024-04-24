import 'package:nagdy_app/features/posts/data/models/api_model.dart';

abstract class PostRepository {
  Future<List<Apiposts>> getCarts(int limit, int skip);
  Future<void> deletePost(int id);
}
