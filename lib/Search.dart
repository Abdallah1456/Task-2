import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchScreen(),
    );
  }
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _meals = [];
  bool _isLoading = false;

  Future<void> _searchMeals(String query) async {
    if (query.isEmpty) {
      setState(() => _meals = []);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$query'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _meals = data['meals'] ?? []; // Handle empty search results
        });
      } else {
        throw Exception('Failed to fetch meals');
      }
    } catch (e) {
      print('Error: $e');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarr("Search", context),
      backgroundColor: Colors.white12,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: "Search for a meal",
                hintText: "e.g. Chicken",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _searchMeals,
            ),
          ),
          _isLoading
              ? const CircularProgressIndicator()
              : Expanded(
            child: _meals.isEmpty
                ? const Center(child: Text("No results found"))
                : ListView.builder(
              itemCount: _meals.length,
              itemBuilder: (context, index) {
                final meal = _meals[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(
                      meal['strMealThumb'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(meal['strMeal']),
                    subtitle: Text(meal['strCategory']),
                    onTap: () {
                      showMealDetails(context, meal);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BtnNav(context),
    );
  }

  void showMealDetails(BuildContext context, dynamic meal) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(meal['strMeal']),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(meal['strMealThumb'],height: 300,),
              const SizedBox(height: 10),
              Text("Category: ${meal['strCategory']}"),
              Text("Area: ${meal['strArea']}"),
              Text("Instructions: ${meal['strInstructions']?.substring(0, 100)}..."),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
