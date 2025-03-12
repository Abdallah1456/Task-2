import 'package:flutter/material.dart';
import 'package:task2/main.dart';

class InstructionsScreen extends StatelessWidget{
  const InstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBarr("Instructions"),

        backgroundColor: Colors.white12,
        body: const Center(child: Text("شوية هري", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold, fontSize: 24),), ),
      
        bottomNavigationBar: BtnNav(),
      ),
    );
  }
}

