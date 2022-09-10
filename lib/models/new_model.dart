import 'package:flutter/material.dart';

class NewsModel {
  final String? title;
  final String? source;
  final String? image;
  final String? content;
  final String? date;
  final String? author;
  final String? desc;
  final String? url;

  NewsModel(
      {required this.title,
      required this.source,
      required this.image,
      required this.content,
      required this.date,
      required this.author,
      required this.desc,
      required this.url});
}
