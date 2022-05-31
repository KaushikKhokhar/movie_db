// ignore_for_file: file_names, non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'api_class1.g.dart';

@JsonSerializable()
class Movie1 {
  int id;
  String title;
  String backdrop_path;
  String overview;
  String original_language;
  num vote_average;
  String release_date;
  num popularity;

  Movie1({
    required this.id,
    required this.title,
    required this.backdrop_path,
    required this.overview,
    required this.original_language,
    required this.vote_average,
    required this.release_date,
    required this.popularity,
  });

  factory Movie1.fromJson(Map<String, dynamic> data) => _$Movie1FromJson(data);

  Map<String, dynamic> toJson() => _$Movie1ToJson(this);
}
