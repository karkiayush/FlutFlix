// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/main.dart';
import 'package:movie_recommendation_app/utils/nav_buttons.dart';
import 'package:movie_recommendation_app/utils/text.dart';

class NavbarDrawer extends StatelessWidget {
  const NavbarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLogedIn = false;
    bool isSwitched = false;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Theme.of(context).primaryColor,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      margin: EdgeInsets.only(left: 20),
                      child: ModifiedText(
                        text: "Justin Tse",
                        color: Colors.white,
                        size: 20,
                        weight: FontWeight.bold,
                      )),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: ModifiedText(
                    text: "Browse",
                    size: 20,
                    color: Colors.white,
                    weight: FontWeight.w500),
              ),
              Divider(
                color: Colors.white,
              ),
              NavButtons(),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
              ),
              Row(
                children: [
                  ModifiedText(
                    text: "Day/Night Mode",
                    size: 18,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState() {
                        isSwitched = value;
                      }
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
