// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/utils/text.dart';
import 'package:movie_recommendation_app/widgets/trending_movies.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FlutFlix",
      theme: ThemeData(
        fontFamily: 'worksans',
        brightness: Brightness.dark,
        primaryColor: Color.fromARGB(255, 78, 183, 142),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /*The trending movies gonna return us the list of the movies. For that, we are creating the list to store those returned data*/
  List trendingMovies = [];
  /*For the top rated*/
  List topRatedMovies = [];
  /*For the popular tv Shows*/
  List popularTvShows = [];
  /*For the upComing*/
  List upcomingMovies = [];

  /*We are going to create a function that fetches trending movies. Here we need the api key before fetching*/
  final String apiKey = '12cfd012349e60ecf4bf6e07b88b94ab';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMmNmZDAxMjM0OWU2MGVjZjRiZjZlMDdiODhiOTRhYiIsInN1YiI6IjY1MDY2NjBmNWFhZGM0MDEwMWI5YTIzMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zIfBgEPa9Oy41HTuO09cWSSdhmGqVJsEkE0_y363s6c';

  /*when the app is loaded, we want the invokation of the loadMovies() function. For that we will be using the initstate function*/
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  /*Loads the trending movies*/
  loadMovies() async {
    /*we need to initialize our TMDB objects*/
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(showErrorLogs: true, showLogs: true),
    );

    /*From the API,we intially are not gonna a get list, we weill get a map of the recommended movie. So firstly store the fetched map in local map and then convert to list*/
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();

    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();

    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    Map upcomingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    // print(trendingResult);
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      popularTvShows = tvResult['results'];
      upcomingMovies = upcomingResult['results'];
    });

    print(trendingMovies);
    // print("\n");
    // print("\n");
    // print(topRatedResult);
    // print("\n");
    // print("\n");
    // print(tvResult);
    // print("\n");
    // print("\n");
    // print(upcomingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ModifiedText(
              text: "FlutFlix",
              size: 30,
              color: Color(0xFFD81F26),
              weight: FontWeight.bold,
            ),
            SizedBox(
              width: 10,
            ),
            Image(
              image: AssetImage('images/film-slate.png'),
              height: 30,
              width: 30,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          TrendingMovies(trending: trendingMovies),
        ],
      ),
    );
  }
}
