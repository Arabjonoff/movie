// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

class Movie {
  Movie({
    required this.results,
  });


  List<MovieResult> results;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    results: List<MovieResult>.from(json["results"].map((x) => MovieResult.fromJson(x))),
  );

}

class MovieResult {
  MovieResult({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
    adult: json["adult"]??false,
    backdropPath: json["backdrop_path"]??"",
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"]??0,
    originalLanguage: json["original_language"]??"",
    originalTitle: json["original_title"]??"",
    overview: json["overview"]??"",
    popularity: json["popularity"].toDouble()??0.0,
    posterPath: json["poster_path"]??"",
    releaseDate: json["release_date"] == null ?DateTime.now():DateTime.parse(json["release_date"]),
    title: json["title"]??"",
    video: json["video"]??false,
    voteAverage: json["vote_average"].toDouble()??0.0,
    voteCount: json["vote_count"]??0,
  );

}

