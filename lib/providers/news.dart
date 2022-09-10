import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kinder_pass_assignment/models/new_model.dart';
import 'package:web_scraper/web_scraper.dart';

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
      // final uri = Uri.parse(article['url']);
      // print(uri);
      // final webScraper = WebScraper(uri.origin);
      // if (await webScraper.loadWebPage(uri.path)) {
      //   List<Map<String, dynamic>> elements = webScraper.getElement('p', []);
      //   print(elements);
      //   elements.forEach((element) {
      //     content += element['title'];
      //   });
      // }
      // print(article['title']);
      // print(article['urlToImage']);
      // print(article['content']);
      // print(content);

      NewsModel newsModel = NewsModel(
          title: article['title'],
          source: article['source']['name'],
          image: article['urlToImage'],
          content: article['content'],
          desc: article['description'],
          author: article['author'],
          date: article['publishedAt'],
          url: article['url']);
      // print(newsModel.image);
      _allNews.add(newsModel);
    }

    isLoading = false;
    notifyListeners();
    return;
  }
}
