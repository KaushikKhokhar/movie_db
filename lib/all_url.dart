class AllUrl {
  static const baseUrl = 'https://api.themoviedb.org/3/movie/';

  static const endPoint =
      '?api_key=d107bbcaad068a47cb2e84855e8d1abd&language=en-US&page= ';

  static const fetchMovieForNowPlaying = baseUrl + 'now_playing' + endPoint;

  static const fetchMovieForPopular = baseUrl + 'popular' + endPoint;

  static const fetchMovieForTopRated = baseUrl + 'top_rated' + endPoint;

  static const fetchMovieForUpcoming = baseUrl + 'upcoming' + endPoint;

  static const rate =
      '/rating?api_key=d107bbcaad068a47cb2e84855e8d1abd&guest_session_id=7e1cf9bfe3a82d4a9095426986511802';

  static const deleteRate =
      '/rating?api_key=d107bbcaad068a47cb2e84855e8d1abd&guest_session_id=058190b05d6507a426a5bec96d07fdf3';
}
