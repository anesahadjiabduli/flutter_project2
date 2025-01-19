import 'package:flutter/material.dart';
<<<<<<< HEAD

import '../services/api_services.dart';
import 'joke_list_screen.dart';
=======
import '../services/api_services.dart';
import 'favorites_screen.dart';
import '../models/joke_model.dart'; // Import the joke model
>>>>>>> 30c7d4b (Added favorites feature and Firebase integration)

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiServices apiService = ApiServices();
  late Future<List<String>> jokeTypes;
<<<<<<< HEAD
=======
  List<Joke> jokesList = [];
  List<Joke> favoriteJokes = [];
>>>>>>> 30c7d4b (Added favorites feature and Firebase integration)

  @override
  void initState() {
    super.initState();
    jokeTypes = ApiServices.fetchJokeTypes();
  }

<<<<<<< HEAD
=======
  // Function to fetch jokes by type
  void _fetchJokesByType(String type) async {
    try {
      final jokes = await ApiServices.fetchJokesByType(type);
      setState(() {
        jokesList = jokes;
      });
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load jokes: $e')),
      );
    }
  }

  // Function to add jokes to favorites
  void _addToFavorites(Joke joke) {
    setState(() {
      favoriteJokes.add(joke);
    });
  }

>>>>>>> 30c7d4b (Added favorites feature and Firebase integration)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke Types'),
        actions: [
          IconButton(
<<<<<<< HEAD
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              Navigator.pushNamed(context, '/randomJoke');
=======
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteJokes: favoriteJokes),
                ),
              );
>>>>>>> 30c7d4b (Added favorites feature and Firebase integration)
            },
          ),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No joke types found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final type = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(type),
                    onTap: () {
<<<<<<< HEAD
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => JokesListScreen(type: type),
                        ),
                      );
=======
                      _fetchJokesByType(type);
>>>>>>> 30c7d4b (Added favorites feature and Firebase integration)
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
