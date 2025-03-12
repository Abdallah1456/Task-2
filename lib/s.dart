import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task2/main.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title} => Album(
        userId: userId,
        id: id,
        title: title,
      ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class SearchScreen extends StatelessWidget{
  const SearchScreen({super.key});


  @override
  Widget build(BuildContext context) {
    TextEditingController text_controller = TextEditingController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarr("Search", context),

        backgroundColor: Colors.white12,
        body: const Padding(
          padding: EdgeInsets.all(250.0),
          child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                // controller: text_controller,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  labelText: "Enter text", labelStyle: TextStyle(color: Colors.white),
                  hintText: "Search something....", hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search, color: Colors.white,),
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: BtnNav(context),
      ),
    );
  }
}

