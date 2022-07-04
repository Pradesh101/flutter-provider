import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider_practice/services/sp_service.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import '../models/movie.dart';

//it's generate a list of movies
final List<Movie> initialData = List.generate(
    10,
    (index) => Movie(
        title: "Movie $index",
        runTime: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider extends ChangeNotifier {
//all movies that will be displayed in homescreen
  final List<Movie> _movies = initialData;

//retrive all movies
  List<Movie> get movies => _movies;

//favorite movies that will be shown in mylist screen
  List<Movie> _myList = [];

//retrive favorite movies
  List<Movie> get myList => _myList;

  setFavorites(List<Movie> data) {
    _myList = data;
    notifyListeners();
  }

//adding movie to my favorite list
  void addToList(Movie movie) {
    _myList.add(movie);
    addToSP(_myList);
    notifyListeners();
  }

//removing a movie from my favorite list
  void removeFromList(Movie movie) {
    _myList.remove(movie);
    removeListString();
    addToSP(_myList);
    notifyListeners();
  }
}
