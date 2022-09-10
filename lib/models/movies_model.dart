import 'package:flutter/material.dart';

class MovieModel {
  final String? title;
  final String? image;
  final bool? adult;
  final List<String?> genres;
  final double? popularity;
  final int? voteCount;
  final String? releaseDate;
  final String? desc;

  MovieModel(
      {required this.title,
      required this.releaseDate,
      required this.image,
      required this.adult,
      required this.genres,
      required this.popularity,
      required this.voteCount,
      required this.desc});
}
