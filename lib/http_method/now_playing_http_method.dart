// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_db/all_url.dart';
import '../model/now_playing.dart';

class NowPlayingHttpMethod {
  List<NowPlayingModelClass> movies = [];

  Future getMovies(int page) async {
    final response = await http.get(
      Uri.parse('${AllUrl.fetchMovieForNowPlaying}$page'),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      movies = (result['results'] as List).map((json) {
        return NowPlayingModelClass.fromJson(json);
      }).toList();
      print('response successful for now playing screen');
      return movies;
    } else {
      print('Error in URL');
    }
  }

  Future postRate(double rating, int id) async {
    try {
     final response = await http.post(
        Uri.parse(
          '${AllUrl.baseUrl}$id${AllUrl.rate}',
        ),
        body: {
          'value': rating.toString(),
        },
      );
      print(response.body);
      return response;
    } catch (error) {
      return;
    }
  }

  Future deleteRate(int id) async {
    try {
      final response = await http.delete(
        Uri.parse(
          '${AllUrl.baseUrl}$id${AllUrl.deleteRate}',
        ),
      );
      print(response.body);
      return response;
    } catch (error) {
      return;
    }
  }
}
