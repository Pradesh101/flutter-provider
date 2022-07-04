import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie.dart';

addToSP(List<Movie> movie) async {
  final String encodedData = Movie.encodeMovieListString(movie);
  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('spmovieList', encodedData);
}

removeListString() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.remove('spmovieList');
}

Future<List<Movie>> getFromSP() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  final String? movieString = pref.getString('spmovieList');
  if (movieString != null) {
    List<Movie> myMovies = Movie.decodeMovieListString(movieString);
    return myMovies;
  } else {
    return [];
  }
}
