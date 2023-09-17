// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/utils/text.dart';
import 'package:movie_recommendation_app/description_screen.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;

  const TopRatedMovies({super.key, required this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      // margin: EdgeInsets.all(10), //xeu xeu ko gap milaune
      // height: 400,
      // width: 300,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ModifiedText(
          text: "Top Rated Movies",
          size: 25,
          color: Colors.white,
          weight: FontWeight.normal,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 270,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                /*returning inkwell since when we click on the banner page, we wanna redirect to the description page*/

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionScreen(
                          name: toprated[index]['original_title'],
                          description: toprated[index]['overview'],
                          vote: toprated[index]['vote_average'].toString(),
                          launchDate: toprated[index]['release_date'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          posterUrl: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    toprated[index]['poster_path'],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: ModifiedText(
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
                                  : "Loading.....",
                              size: 15,
                              color: Colors.white,
                              weight: FontWeight.normal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ]),
    );
  }
}
