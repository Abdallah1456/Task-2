import 'package:flutter/material.dart';
import 'main.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Favorite(),
    );
  }
}


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr("Categories"),

      bottomNavigationBar: BtnNav(),
    );
  }
}
