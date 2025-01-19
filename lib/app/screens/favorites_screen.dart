import 'package:flutter/material.dart';
import '../models/joke_model.dart'; // Import the Joke model

class FavoritesScreen extends StatelessWidget {
  final List<Joke> favoriteJokes;

  FavoritesScreen({required this.favoriteJokes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Jokes'),
      ),
      body: favoriteJokes.isEmpty
          ? const Center(
              child: Text('No favorite jokes yet!'),
            )
          : ListView.builder(
              itemCount: favoriteJokes.length,
              itemBuilder: (context, index) {
                final joke = favoriteJokes[index];
                return ListTile(
                  title: Text(joke.setup),
                  subtitle: Text(joke.punchline),
                );
              },
            ),
    );
  }
}
