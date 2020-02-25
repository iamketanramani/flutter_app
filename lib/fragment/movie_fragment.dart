import 'package:flutter/material.dart';

class MovieFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieFragmentState();
  }
}

class MovieFragmentState extends State<MovieFragment> {
  String url = "https://api.androidhive.info/json/movies.json";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('API Calling'),
      ),
    );
  }
}
