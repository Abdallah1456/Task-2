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

Future<Album> fetch_Instructions_Album() async {
  final response = await http.get(
    Uri.parse('www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast'),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>));
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class InstructionsScreen extends StatelessWidget{
  const InstructionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarr("Instructions", context),

        backgroundColor: Colors.white12,
        body: const Center(child:
        Text("Category: Beef\nArea: British\nInstructions: Put the mushrooms into a food processor with some reasoning and pulse to a rough paste. "
          , style: TextStyle(
            color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 24),),),

        bottomNavigationBar: BtnNav(context),
      ),
    );
  }
}

