import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/providers/news.dart';
import 'package:kinder_pass_assignment/shared/loading_bar.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      var newsProvider = Provider.of<News>(context, listen: false);
      newsProvider.getAllNews();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: Consumer<News>(builder: (context, item, _) {
          return MyLoadingBar(
            isLoading: item.isLoading,
            child: Container(),
          );
        }));
  }
}
