// ignore_for_file: file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'now_playing.g.dart';

@JsonSerializable()
class NowPlayingModelClass {
  int id;
  String title;
  String backdrop_path;
  String overview;
  String original_language;
  num vote_average;
  String release_date;
  num popularity;

  NowPlayingModelClass({
    required this.id,
    required this.title,
    required this.backdrop_path,
    required this.overview,
    required this.original_language,
    required this.vote_average,
    required this.release_date,
    required this.popularity,
  });

  factory NowPlayingModelClass.fromJson(Map<String, dynamic> data) => _$NowPlayingModelClassFromJson(data);

  Map<String, dynamic> toJson() => _$NowPlayingModelClassToJson(this);
}
