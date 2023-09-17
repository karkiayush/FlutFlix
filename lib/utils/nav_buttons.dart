// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/utils/text.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Container(
          child: Column(children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.other_houses_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ModifiedText(
                        text: "Home",
                        size: 18,
                        color: Colors.white,
                        weight: FontWeight.bold)
                  ],
                ))
          ]),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
          child: Column(children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ModifiedText(
                        text: "Search",
                        size: 18,
                        color: Colors.white,
                        weight: FontWeight.bold)
                  ],
                ))
          ]),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
          child: Column(children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ModifiedText(
                        text: "Saved",
                        size: 18,
                        color: Colors.white,
                        weight: FontWeight.bold)
                  ],
                ))
          ]),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
          child: Column(children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.feedback,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ModifiedText(
                        text: "Feedback",
                        size: 18,
                        color: Colors.white,
                        weight: FontWeight.bold)
                  ],
                ))
          ]),
        ),
        Divider(
          color: Colors.white,
        ),
        Container(
          child: Column(children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ModifiedText(
                        text: "Logout",
                        size: 18,
                        color: Colors.white,
                        weight: FontWeight.bold)
                  ],
                ))
          ]),
        ),
      ]),
    );
  }
}
