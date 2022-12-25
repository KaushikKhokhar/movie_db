// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'upcoming_model.g.dart';

@JsonSerializable()
class UpcomingModel {
  int id;
  String title;
  String backdrop_path;
  String overview;
  String original_language;
  num vote_average;
  String release_date;
  num popularity;

  UpcomingModel({
    required this.id,
    required this.title,
    required this.backdrop_path,
    required this.overview,
    required this.original_language,
    required this.vote_average,
    required this.release_date,
    required this.popularity,
  });

  factory UpcomingModel.fromJson(Map<String, dynamic> data) =>
      _$UpcomingModelFromJson(data);

  Map<String, dynamic> toJson() => _$UpcomingModelToJson(this);
}
