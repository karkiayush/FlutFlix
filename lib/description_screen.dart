// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/utils/text.dart';

class DescriptionScreen extends StatelessWidget {
  final String name;
  final String description;
  final String vote;
  final String launchDate;
  final String bannerUrl;
  final String posterUrl;

  const DescriptionScreen({
    super.key,
    required this.name,
    required this.description,
    required this.vote,
    required this.launchDate,
    required this.bannerUrl,
    required this.posterUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                // decoration: BoxDecoration(color: Colors.amber),
                height: 270,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width,
                        /*If the child of the container is Image, we need to use the Image.network widget instead of the networkImage() widget*/
                        child: Image.network(bannerUrl, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                        left: 10,
                        bottom: 60,
                        child: ModifiedText(
                          text: 'Average Rating ⭐: ' + vote,
                          color: Colors.white,
                          size: 15,
                          weight: FontWeight.normal,
                        )),
                    Positioned(
                        bottom: 1,
                        left: 4,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFFD81F26),
                                  borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.all(10),
                              child: ModifiedText(
                                text: "Release date 🗓️: " + launchDate,
                                size: 14,
                                weight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 100),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.save_alt_sharp,
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                ))
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ModifiedText(
                  text: name != null ? name : "No information provided",
                  size: 25,
                  color: Colors.white,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ModifiedText(
                  text: description,
                  size: 15,
                  color: Colors.white,
                  weight: FontWeight.normal,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
