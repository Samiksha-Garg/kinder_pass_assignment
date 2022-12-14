import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/constants.dart';
import 'package:kinder_pass_assignment/helper/size_config.dart';
import 'package:kinder_pass_assignment/models/new_model.dart';
import 'package:kinder_pass_assignment/providers/news.dart';
import 'package:kinder_pass_assignment/screens/news/article.dart';
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
            child: item.isLoading
                ? Container()
                : SafeArea(
                    child: ListView.builder(
                        itemCount: item.news.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              NewsModel newsModel = NewsModel(
                                  title: item.news[index].title,
                                  source: item.news[index].source,
                                  image: item.news[index].image,
                                  content: item.news[index].content,
                                  date: item.news[index].date,
                                  author: item.news[index].author,
                                  desc: item.news[index].desc,
                                  url: item.news[index].url);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NewsArticle(article: newsModel)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              constraints: BoxConstraints(
                                  minHeight: getProportionateScreenHeight(12)),
                              // height: getProportionateScreenHeight(12),
                              margin: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(2.5),
                                  vertical: getProportionateScreenHeight(1)),
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(1)),
                              child: Row(children: [
                                Image.network(
                                  item.news[index].image ??
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkfp5mocLO_5ScsRsmyT3DACKNyoatjpQTtQ&usqp=CAU",
                                  width: getProportionateScreenWidth(22),
                                  height: getProportionateScreenHeight(12),
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(5),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        item.news[index].title ?? "Title",
                                        // overflow: TextOverflow.ellipsis,
                                        // maxLines: 3,
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(4),
                                            fontFamily: "Poppins"),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          );
                        }),
                  ),
          );
        }));
  }
}
