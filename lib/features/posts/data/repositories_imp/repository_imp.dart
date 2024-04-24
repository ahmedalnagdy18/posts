import 'package:nagdy_app/features/posts/data/data_sources/post.dart';
import 'package:nagdy_app/features/posts/data/models/api_model.dart';
import 'package:nagdy_app/features/posts/domain/repositories/repostory.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Apiposts>> getCarts(int limit, int skip) async {
    try {
      return await remoteDataSource.fetchPosts(limit, skip);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deletePost(int postId) async {
    try {
      await remoteDataSource.deletePost(postId);
    } catch (e) {
      rethrow;
    }
  }
}
