import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kinder_pass_assignment/models/new_model.dart';

class News with ChangeNotifier {
  final apiUrl =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=$kNewsApi';

  bool isLoading = false;
  List<NewsModel> _allNews = [];

  get news => _allNews;

  Future<dynamic> _fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);
    return data;
  }

  Future<void> getAllNews() async {
    isLoading = true;
    notifyListeners();
    _allNews.clear();
    var data = await _fetchData();

    for (var article in data['articles']) {
      if (article['urlToImage'] == null || article['content'] == null) {
        continue;
      }

      NewsModel newsModel = NewsModel(
          title: article['title'],
          source: article['source']['name'],
          image: article['urlToImage'],
          content: article['content']);
      _allNews.add(newsModel);
    }
    print(_allNews);
    isLoading = false;
    notifyListeners();
    return;
  }
}
