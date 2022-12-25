// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'popular_model.g.dart';

@JsonSerializable()
class PopularModel {
  int id;
  String title;
  String backdrop_path;
  String overview;
  String original_language;
  num vote_average;
  String release_date;
  num popularity;

  PopularModel({
    required this.id,
    required this.title,
    required this.backdrop_path,
    required this.overview,
    required this.original_language,
    required this.vote_average,
    required this.release_date,
    required this.popularity,
  });

  factory PopularModel.fromJson(Map<String, dynamic> data) =>
      _$PopularModelFromJson(data);

  Map<String, dynamic> toJson() => _$PopularModelToJson(this);
}
