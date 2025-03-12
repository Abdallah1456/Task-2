import 'package:flutter/material.dart';
import 'package:task2/Categories.dart';
import 'package:task2/Instructions.dart';
import 'main.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarr("HomePage"),

        backgroundColor: Colors.white12,
        body: ListView(children:[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("What would you like to eat today?", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
      
                GestureDetector(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InstructionsScreen()),);
                  },

                child: Image.asset("assets/Beef.jpg", height: 280,), ),
                const SizedBox(height: 10,),
                const Text("Our Suggestions", style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16, color: Colors.grey,),),
                const SizedBox(height: 10,),

                SizedBox(
                  height: 640,
                  child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: food_categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => const InstructionsScreen()),);},
                      child: Row(children:
                        [
                        Column(
                          children: [
                          Image.asset(food_categories[index]['image']!, height: 200,),
                          Text(food_categories[index]['name']!, style:
                          const TextStyle(color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,),)
                          ],
                        ), const SizedBox(width: 52)
                    ],),);
                }),
                ),
            ],),
          )
        ],),
        bottomNavigationBar: BtnNav(),
      ),
    );
  }
}
