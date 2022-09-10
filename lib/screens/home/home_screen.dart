import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kinder_pass_assignment/helper/constants.dart';
import 'package:kinder_pass_assignment/helper/size_config.dart';
import 'package:kinder_pass_assignment/providers/movies.dart';
import 'package:kinder_pass_assignment/screens/home/components/home_card.dart';
import 'package:http/http.dart' as http;
import 'package:kinder_pass_assignment/screens/movies/movies_screen.dart';
import 'package:kinder_pass_assignment/screens/news/new_screen.dart';
import 'package:provider/provider.dart';

import '../../providers/news.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newsProvider = Provider.of<News>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kinder Pass"),
      ),
      body: SafeArea(
        child: Container(
          constraints:
              BoxConstraints(minHeight: getProportionateScreenHeight(100)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeCard(
                  title: "News",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsScreen()));
                  },
                  color: kPrimaryColor,
                ),
                HomeCard(
                    title: "Movies",
                    color: kSecondaryColor,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoviesScreen()));
                    }),
              ]),
        ),
      ),
    );
  }
}
