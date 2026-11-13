import 'package:flutter/material.dart';

void main() {
  runApp(const FilmotekaApp());
}

class FilmotekaApp extends StatelessWidget {
  const FilmotekaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Filmoteka',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: Scaffold(appBar: AppBar(title: const Text('Filmoteka'))),
    );
  }
}