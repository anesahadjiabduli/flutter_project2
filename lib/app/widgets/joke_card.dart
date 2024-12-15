import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String type;
  final Function onTap;

  JokeCard({required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(type),
      child: Card(
        child: Center(
          child: Text(type),
        ),
      ),
    );
  }
}
