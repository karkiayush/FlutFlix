// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/main.dart';
import 'package:movie_recommendation_app/utils/text.dart';

class NavbarDrawer extends StatelessWidget {
  const NavbarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogedIn = false;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: isLogedIn == true
                        ? Image(
                            image: AssetImage('images/film-slate.png'),
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.person_2_rounded,
                          ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: ModifiedText(
                        text: "Justin Tse",
                        color: Colors.black,
                        size: 20,
                        weight: FontWeight.bold,
                      )),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
