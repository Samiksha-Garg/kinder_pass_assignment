import 'package:flutter/material.dart';
import 'package:kinder_pass_assignment/helper/size_config.dart';
import 'package:kinder_pass_assignment/models/movies_model.dart';
import 'package:kinder_pass_assignment/providers/movies.dart';
import 'package:kinder_pass_assignment/providers/news.dart';
import 'package:kinder_pass_assignment/screens/movies/movie_item.dart';
import 'package:kinder_pass_assignment/shared/loading_bar.dart';
import 'package:provider/provider.dart';

import '../../helper/constants.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      var moviesProvider = Provider.of<Movies>(context, listen: false);
      moviesProvider.getAllMovies();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: Consumer<Movies>(builder: (context, item, _) {
          return MyLoadingBar(
            isLoading: item.isLoading,
            child: item.isLoading
                ? Container()
                : SafeArea(
                    child: ListView.builder(
                        itemCount: item.movies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              MovieModel movieModel = MovieModel(
                                  title: item.movies[index].title,
                                  releaseDate: item.movies[index].releaseDate,
                                  image: item.movies[index].image,
                                  adult: item.movies[index].adult,
                                  genres: item.movies[index].genres,
                                  popularity: item.movies[index].popularity,
                                  voteCount: item.movies[index].voteCount,
                                  desc: item.movies[index].desc);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MovieItem(
                                            movieModel: movieModel,
                                          )));
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
                                  item.movies[index].image ??
                                      "https://i.pinimg.com/originals/54/51/75/54517514b7e9c8c21cb1526176c30732.jpg",
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
                                        item.movies[index].title ?? "Title",
                                        // overflow: TextOverflow.ellipsis,
                                        // maxLines: 3,
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(5),
                                            fontWeight: FontWeight.bold,
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
