import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? skip;
  final int? limit;

  PostEntity({this.skip, this.limit});

  @override
  // TODO: implement props
  List<Object?> get props => [skip, limit];
}
