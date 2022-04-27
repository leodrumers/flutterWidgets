import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  static final List<String> options = [
    'Cien años de soledad',
    'El coronel en su laberinto',
    'La epopeya',
    'Del amor y otros demonios'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Listview #1'),
      ),
      body: ListView(
        children: [
          ...options
              .map((book) => ListTile(
                    title: Text(book),
                    trailing: const Icon(Icons.arrow_right_outlined),
                  ))
              .toList()
        ],
      ),
    );
  }
}
