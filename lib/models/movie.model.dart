import 'dart:convert';

class Movie {
  final String posterPath;
  final String title;
  final String releaseDate;
  final dynamic voteAverage;

  Movie({
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<dynamic, dynamic> json) {
    return Movie(
        posterPath: json['poster_path'],
        title: json['title'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
      );
  } 

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  Map<String, dynamic> toJson() => {
        'poster_path': posterPath,
        'title': title,
        'release_date': releaseDate,
        'vote_average': voteAverage,
      };

  String toRawJson() => json.encode(toJson());

  @override
  String toString() {
    return 'Movie {posterPath: $posterPath, title: $title, release_date: $releaseDate, vote_average: $voteAverage}';
  }

}
