import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieFragmentState();
  }
}

class MovieFragmentState extends State<MovieFragment> {
  String url = "https://api.androidhive.info/json/movies.json";
  String _response = "";
  List<MovieModel> movieList = [];

  @override
  void initState() {
    super.initState();
    //checkConnection();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final item = this.movieList[index];
            return Card(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                /*child: ListTile(
                  title: Text(item.title),
                  subtitle: Text(item.releaseYear),
                ));*/
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          /*Image.network(
                            item.image,
                            width: 100.0,
                            height: 100.0,
                          )*/
                          FadeInImage.assetNetwork(
                            placeholder: 'assets/flutter_back.png',
                            image: item.image,
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.title,
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            item.releaseYear,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  ],
                ));
          },
          itemCount: this.movieList.length,
        ),
      ),
    );
  }

  void getMovies() async {
    final response = await http.get(url);
    final List<MovieModel> records = jsonDecode(response.body)
        .map<MovieModel>((json) => MovieModel.fromJSON(json))
        .toList();
    setState(() {
      _response = response.body;
      movieList.clear();
      movieList.addAll(records);
    });
  }

  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint("Ketan: Internet Connection Available: " + result.toString());
        return true;
      }
    } on SocketException catch (_) {
      debugPrint("Ketan: No Internet Connection");
      return false;
    }
  }
}
