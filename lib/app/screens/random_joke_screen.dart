import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/models/joke_model.dart';
import 'package:flutter_application_2/app/services/api_services.dart';


class RandomJokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              Joke randomJoke = await ApiServices.fetchRandomJoke();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text('Random Joke'),
                    ),
                    body: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              randomJoke.setup,
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(height: 20),
                            Text(
                              randomJoke.punchline,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<Joke>(
        future: ApiServices.fetchRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var joke = snapshot.data!;
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      joke.setup,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    Text(
                      joke.punchline,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
