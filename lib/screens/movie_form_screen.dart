import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieFormScreen extends StatefulWidget {
  const MovieFormScreen({super.key});

  @override
  State<MovieFormScreen> createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();

  final _genres = [
    'Akcija',
    'Animirani',
    'Drama',
    'Komedija',
    'Znanstvena fantastika',
  ];

  MovieType _type = MovieType.film;
  String _genre = 'Drama';
  double _rating = 5;
  bool _watched = false;
  bool _favorite = false;

  String summary = '';

  @override
  void dispose() {
    _titleController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _clear() {
    _titleController.clear();
    _yearController.clear();
  }

  void _save() {
    setState(() {
      summary =
          '${_titleController.text},${_yearController.text},${_type.name}, '
          '$_genre, ocjena ${_rating.round()}, pogledano: $_watched, '
          'favorit: $_favorite';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novi film')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Naslov',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _yearController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Godina',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          RadioGroup<MovieType>(
            groupValue: _type,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _type = value;
                });
              }
            },
            child: const Column(
              children: [
                RadioListTitle(value: MovieType.film, title: Text('Film')),
                RadioListTitle(value: MovieType.series, title: Text('Serija')),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text('Žanr'),
          DropdownButton<String>(
            value: _genre,
            items: _genres
                .map(
                  (genre) =>
                      DropdownMenuItem(value: genre, child: const Text(genre)),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  _genre = value;
                }
              });
            },
          ),
          const SizedBox(height: 12),
          const Text('Ocjena: ${_rating.round()}'),
          Slider(
            value: _rating,
            min: 1,
            max: 10,
            divisions: 9,
            label: _rating.round().toString(),
            onChanged: (value) {
              setState(() {
                _rating = value;
              });
            },
          ),
          const SizedBox(height: 12),
          CheckboxListTile(
            title: const Text('Pogledano'),
            value: _watched,
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  _watched = value;
                }
              });
            },
          ),
          SwitchListTile(
            title: const Text('Favorit'),
            value: _favorite,
            onChanged: (value) {
              setState(() {
                if (value != null) {
                  _favorite = value;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
