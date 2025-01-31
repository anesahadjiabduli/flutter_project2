import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/models/joke_model.dart';
import 'package:flutter_application_2/app/services/api_services.dart';


class JokesListScreen extends StatelessWidget {
  final String type;

<<<<<<< HEAD
  JokesListScreen({required this.type});
=======
  JokesListScreen({required this.type, required void Function(Map<String, dynamic> joke) toggleFavorite});
>>>>>>> 30c7d4b (Added favorites feature and Firebase integration)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Jokes'),
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiServices.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(jokes[index].setup),
                  subtitle: Text(jokes[index].punchline),
                );
              },
            );
          }
        },
      ),
    );
  }
}
