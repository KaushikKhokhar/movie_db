// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_class1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie1 _$Movie1FromJson(Map<String, dynamic> json) => Movie1(
      id: json['id'] as int,
      title: json['title'] as String,
      backdrop_path: json['backdrop_path'].toString(),
      overview: json['overview'] as String,
      original_language: json['original_language'] as String,
      vote_average: json['vote_average'] as num,
      release_date: json['release_date'] as String,
      popularity: json['popularity'] as num,
    );

Map<String, dynamic> _$Movie1ToJson(Movie1 instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdrop_path,
      'overview': instance.overview,
      'original_language': instance.original_language,
      'vote_average': instance.vote_average,
      'release_date': instance.release_date,
      'popularity': instance.popularity,
    };