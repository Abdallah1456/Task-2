import 'package:flutter/material.dart';
import 'package:task2/main.dart';

import 'Instructions.dart';

  final List<Map<String, String>> food_categories = [
    {'name': 'Beef', 'image': 'assets/Beef.jpg'},
    {'name': 'Chicken', 'image': 'assets/Chicken.jpg'},
    {'name': 'Dessert', 'image': 'assets/Dessert.jpg'},
    {'name': 'Lamb', 'image': 'assets/Lamb.jpg'},
    {'name': 'Miscellaneous', 'image': 'assets/Miscellaneous.jpg'},
    {'name': 'Pasta', 'image': 'assets/Pasta.jpg'},
    {'name': 'Seafood', 'image': 'assets/Seafood.jpg'},
    {'name': 'Side', 'image': 'assets/Side.jpg'},
    {'name': 'Starter', 'image': 'assets/Starter.jpg'},
    {'name': 'Vegan', 'image': 'assets/Vegan.jpg'},
    {'name': 'Vegetarian', 'image': 'assets/Vegetarian.jpg'},
  ];


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarr("Categories", context),
      
      
        backgroundColor: Colors.white12,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
            ), itemCount: food_categories.length,
            itemBuilder: (context, index) {
      
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InstructionsScreen()),);
                  fetchAlbum().then((value){
                    print(value.id);
                    print(value.title);
                    print(value.userId);
                  });
                print("Tapped on");
              },
      
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(food_categories[index]['image']!, height: 300, ),
                    const SizedBox(height: 5),
                    Text(food_categories[index]['name']!,style:
                    const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 26,),),
                  ],
                ),
              );
      
            },
          ),
        ),
      
      
        bottomNavigationBar: BtnNav(context),
      ),
    );
  }
}
