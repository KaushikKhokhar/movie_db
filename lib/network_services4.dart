import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_db/api_class4.dart';

class NetworkServices4 {
  List<Movie4> movies = [];

  Future getMovies(int page) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=d107bbcaad068a47cb2e84855e8d1abd&language=en-US&page=$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      movies = (result['results'] as List).map((json) {
        return Movie4.fromJSON(json);
      }).toList();
      print('Response is successful for upcoming screen');
      return movies;
    } else {
      print('Error in url');
    }
  }

  Future postRate(double rating ,int id) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/rating?api_key=d107bbcaad068a47cb2e84855e8d1abd&guest_session_id=7e1cf9bfe3a82d4a9095426986511802');
    try {
      final response = await http.post(url, body: {'value': rating.toString()});
      print(response.body);
      return response;
    } catch (error) {
      return;
    }
  }

  Future deleteRate(int id) async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/rating?api_key=d107bbcaad068a47cb2e84855e8d1abd&guest_session_id=058190b05d6507a426a5bec96d07fdf3');
    try {
      final response = await http.delete(url);
      print(response.body);
      return response;
    } catch (error) {
      return;
    }
  }

}
