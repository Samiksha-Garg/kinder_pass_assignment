import 'package:flutter/material.dart';

class NewsModel {
  final String title;
  final String source;
  final String image;
  final String content;

  NewsModel(
      {required this.title,
      required this.source,
      required this.image,
      required this.content});
}
