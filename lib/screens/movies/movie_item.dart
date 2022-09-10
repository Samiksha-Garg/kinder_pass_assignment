import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/models/movies_model.dart';

import '../../helper/size_config.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({Key? key, required this.movieModel}) : super(key: key);
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    TextStyle subHeadings = TextStyle(
        fontWeight: FontWeight.bold, fontSize: getProportionateScreenWidth(3));
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Image.network(
            movieModel.image != null
                ? movieModel.image.toString()
                : "https://i.pinimg.com/originals/54/51/75/54517514b7e9c8c21cb1526176c30732.jpg",
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
              movieModel.title == null ? "Title" : movieModel.title.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(5)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var item in movieModel.genres)
                Text(
                  item.toString(),
                  style: subHeadings,
                )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(2),
          ),
          movieModel.adult == false || movieModel.adult == true
              ? Text(
                  "Rated : U",
                  style: subHeadings,
                )
              : Text(
                  "Rated : A",
                  style: subHeadings,
                ),
          movieModel.releaseDate == null
              ? Container()
              : Text(
                  "Release Date : " + movieModel.releaseDate.toString(),
                  style: subHeadings,
                ),
          movieModel.popularity == null
              ? Container()
              : Text(
                  "Popularity : " + movieModel.popularity.toString(),
                  style: subHeadings,
                ),
          movieModel.voteCount == null
              ? Container()
              : Text(
                  "Vote Count : " + movieModel.voteCount.toString(),
                  style: subHeadings,
                ),
          SizedBox(
            height: getProportionateScreenHeight(2),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(3)),
            child: Text(
              movieModel.desc == null ? "" : movieModel.desc.toString(),
              // style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: getProportionateScreenWidth(5)),
            ),
          ),
        ]),
      )),
    );
  }
}
