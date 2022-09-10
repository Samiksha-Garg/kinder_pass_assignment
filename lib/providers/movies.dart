import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kinder_pass_assignment/models/movies_model.dart';

class Movies with ChangeNotifier {
  final apiUrl =
      "https://api.themoviedb.org/3/trending/all/day?api_key=$kMoviesApi";
  final genreUrl1 =
      "https://api.themoviedb.org/3/genre/movie/list?api_key=$kMoviesApi";
  final genreUrl2 =
      "https://api.themoviedb.org/3/genre/tv/list?api_key=$kMoviesApi";
  bool isLoading = false;
  List<MovieModel> _allMovies = [];

  Map<int, String> _genres = {};

  get movies => _allMovies;

  Future<dynamic> _fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);
    return data;
  }

  Future<void> _fetchGenres() async {
    final response = await http.get(Uri.parse(genreUrl1));
    final data = json.decode(response.body);

    for (var genre in data['genres']) {
      _genres.putIfAbsent(genre['id'], () => genre['name']);
    }

    final res = await http.get(Uri.parse(genreUrl2));
    final dat = json.decode(res.body);

    for (var genre in dat['genres']) {
      _genres.putIfAbsent(genre['id'], () => genre['name']);
    }
  }

  Future<void> getAllMovies() async {
    isLoading = true;
    notifyListeners();
    _allMovies.clear();
    await _fetchGenres();

    final data = await _fetchData();
    for (var movie in data['results']) {
      print(movie);
      // print(movie['original_title']);

      List<String?> g = [];

      for (var gen in movie['genre_ids']) {
        g.add(_genres[gen]);
      }

      MovieModel movieModel = MovieModel(
          desc: movie['overview'],
          adult: movie['adult'],
          genres: g,
          releaseDate: movie['release_date'],
          popularity: movie['popularity'],
          voteCount: movie['vote_count'],
          title: movie['title'],
          image: movie['backdrop_path'] != null
              ? "https://image.tmdb.org/t/p/w500${movie['backdrop_path']}"
              : null);
      // print(movieModel.title);

      _allMovies.add(movieModel);
    }

    isLoading = false;
    notifyListeners();
  }
}
