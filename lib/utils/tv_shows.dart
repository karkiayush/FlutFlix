// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/utils/text.dart';

class TvShows extends StatelessWidget {
  final List tvshow;

  const TvShows({super.key, required this.tvshow});

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
          text: "Popular TV Shows",
          size: 25,
          color: Colors.white,
          weight: FontWeight.normal,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvshow.length,
              itemBuilder: (context, index) {
                /*returning inkwell since when we click on the banner page, we wanna redirect to the description page*/

                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    width: 270,
                    child: Column(
                      children: [
                        Container(
                          width: 270,
                          height: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      tvshow[index]['backdrop_path'],
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 70,
                          child: ModifiedText(
                            text: tvshow[index]['original_name'] != null
                                ? tvshow[index]['original_name']
                                : "Loading.....",
                            size: 20,
                            color: Colors.white,
                            weight: FontWeight.normal,
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
