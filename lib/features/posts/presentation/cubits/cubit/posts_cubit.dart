import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagdy_app/features/posts/data/models/api_model.dart';
import 'package:nagdy_app/features/posts/domain/usecase/usecase.dart';
import 'package:nagdy_app/features/posts/presentation/cubits/cubit/posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostUsecase postUsecase;
  List<Apiposts> newPost = [];
  PostsCubit(this.postUsecase) : super(PostsInitial());

  Future<void> fetchData(int limit, int skip) async {
    try {
      final response = await postUsecase.call(limit, skip);
      newPost.addAll(response);
      if (response.isNotEmpty) {
        emit(PostsLoaded(newPost));
      }
    } catch (e) {
      emit(const PostsError('no data found'));
    }
  }
}
