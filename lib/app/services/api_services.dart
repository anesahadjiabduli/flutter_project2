import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/joke_model.dart';

class ApiServices {
  static const _baseUrl = 'https://official-joke-api.appspot.com/';

  // Fetch joke types
  static Future<List<String>> fetchJokeTypes() async {
    final response = await http.get(Uri.parse('$_baseUrl/types'));
    if (response.statusCode == 200) {
      return List<String>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load joke types');
    }
  }

  // Fetch jokes by type
  static Future<List<Joke>> fetchJokesByType(String type) async {
    final response = await http.get(Uri.parse('$_baseUrl/jokes/$type/ten'));
    if (response.statusCode == 200) {
      var jokesJson = json.decode(response.body) as List;
      return jokesJson.map((json) => Joke.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load jokes');
    }
  }

  // Fetch random joke
  static Future<Joke> fetchRandomJoke() async {
    final response = await http.get(Uri.parse('$_baseUrl/random_joke'));
    if (response.statusCode == 200) {
      return Joke.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load random joke');
    }
  }
}
