import 'package:flutter/material.dart';
import 'main.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favorite(),
    );
  }
}


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarr("Favorites", context),
        body: const Center(child: Text("You have no favorites", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 24),)),
        backgroundColor: Colors.white12,
        bottomNavigationBar: BtnNav(context),
      ),
    );
  }
}
