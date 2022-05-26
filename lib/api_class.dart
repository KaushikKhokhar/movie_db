class Movie {
  int id;
  String title;
  String image;
  String description;
  String language;
  num rate;
  String releaseDate;
  num popularity;

  Movie({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.language,
    required this.rate,
    required this.releaseDate,
    required this.popularity,
  });

  factory Movie.fromJSON(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      image: json['backdrop_path'].toString(),
      description: json['overview'],
      language: json['original_language'],
      rate: json['vote_average'],
      releaseDate: json['release_date'],
      popularity: json['popularity'],
    );
  }
}
