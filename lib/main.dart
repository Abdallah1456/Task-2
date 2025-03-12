import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:task2/Categories.dart';
import 'package:http/http.dart' as http;
import 'package:task2/HomePage.dart';
import 'Favorite.dart';
// import 'Search.dart';
import 'Search.dart';

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
    Uri.parse('www.themealdb.com/api/json/v1/1/categories.php'),
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

PreferredSizeWidget AppBarr(String label, context) {
  return AppBar(
    actions: [IconButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  SearchScreen()),);
    }, icon: const Icon(Icons.search))],
    title: Center(child: Text(label)),
    backgroundColor: Colors.grey,
  );
 }


Widget BtnNav(context){
  return Container(
  color: Colors.grey,
  child:  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

    IconButton(icon: const Icon(Icons.category), onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CategoriesScreen()),);  },),

    IconButton(icon: const Icon(Icons.home), onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const HomePageScreen()),); }, ),

    IconButton(icon: const Icon(Icons.favorite), onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  const FavoriteScreen()),); }, ),

  ],)
);}


void main() {
  runApp( const HomePageScreen());
  // runApp( const InstructionsScreen());
  // runApp( const CategoriesScreen());

}

