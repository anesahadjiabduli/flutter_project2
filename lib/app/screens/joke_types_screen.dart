import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/services/api_services.dart';
import 'package:flutter_application_2/app/widgets/joke_card.dart';
import 'joke_list_screen.dart';

class JokeTypesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Types'),
      ),
      body: FutureBuilder<List<String>>(
        future: ApiServices.fetchJokeTypes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var jokeTypes = snapshot.data!;
            return ListView.builder(
              itemCount: jokeTypes.length,
              itemBuilder: (context, index) {
                return JokeCard(
                  type: jokeTypes[index],
                  onTap: (type) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => JokesListScreen(type: type)),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
