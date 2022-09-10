import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/size_config.dart';
import 'package:kinder_pass_assignment/models/new_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsArticle extends StatelessWidget {
  const NewsArticle({Key? key, required this.article}) : super(key: key);
  final NewsModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.network(
              article.image != null
                  ? article.image.toString()
                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQkfp5mocLO_5ScsRsmyT3DACKNyoatjpQTtQ&usqp=CAU",
              width: double.infinity,
              height: getProportionateScreenHeight(30),
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: getProportionateScreenHeight(2),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(2)),
              child: Text(
                article.title == null ? "Title" : article.title.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(5)),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(2),
            ),
            article.date == null
                ? Container()
                : Text(
                    "Published At : ${article.date}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(3)),
                  ),
            article.source == null
                ? Container()
                : Text(
                    "Source : ${article.source}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(3)),
                  ),
            article.author == null
                ? Container()
                : Text(
                    "Author : ${article.author}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(3)),
                  ),
            SizedBox(
              height: getProportionateScreenHeight(2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(3)),
              child: Text(
                article.desc == null ? "" : article.desc.toString(),
                // style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: getProportionateScreenWidth(5)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(3)),
              child: Text(
                article.content == null ? "" : article.content.toString(),
                // style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: getProportionateScreenWidth(5)),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(2),
            ),
            article.url == null
                ? Container()
                : Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(3)),
                    child: InkWell(
                        child: Column(
                          children: [
                            Text("View More At : "),
                            Text(
                              article.url.toString(),
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        onTap: () => launch(article.url.toString())),
                  ),
          ],
        )),
      ),
    );
  }
}
