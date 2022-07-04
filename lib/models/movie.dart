import 'dart:convert';

class Movie {
  final String title;
  final String? runTime; // how long this movie is (in minute)
  Movie({
    required this.title,
    this.runTime,
  });

  factory Movie.fromJson(Map<String, dynamic> jsonData) {
    return Movie(title: jsonData['title'], runTime: jsonData['runTime']);
  }

  Map<String, dynamic> toMap(Movie movie) => {
        'title': movie.title,
        'runTime': movie.runTime,
      };

  static String encodeMovieListString(List<Movie> movies) => json.encode(
        movies
            .map<Map<String, dynamic>>((movie) => movie.toMap(movie))
            .toList(),
      );

  static List<Movie> decodeMovieListString(String movies) =>
      (json.decode(movies) as List<dynamic>)
          .map<Movie>((item) => Movie.fromJson(item))
          .toList();
}
