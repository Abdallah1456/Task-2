import 'package:flutter/material.dart';
import 'package:task2/Categories.dart';
import 'package:task2/HomePage.dart';
import 'package:task2/Instructions.dart';

PreferredSizeWidget AppBarr(String label) {
  return AppBar(
    actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search))],
    title: Text(label),
    backgroundColor: Colors.grey,
  );
 }

Widget BtnNav(){
  return BottomNavigationBar(
  backgroundColor: Colors.grey,
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    ],
    selectedItemColor: Colors.pink,
);}

void main() {
  runApp( const HomePageScreen());
  // runApp( const InstructionsScreen());
  // runApp( const CategoriesScreen());

}

