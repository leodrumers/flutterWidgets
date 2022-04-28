import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class ListviewScreen extends StatelessWidget {
  const ListviewScreen({Key? key}) : super(key: key);

  static final List<String> options = [
    'Cien años de soledad',
    'El coronel en su laberinto',
    'La epopeya',
    'Del amor y otros demonios'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Listview #1')),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing:
              const Icon(Icons.arrow_forward_ios, color: AppTheme.primaryColor),
          onTap: () {
            final game = options[index];
            print(game);
          },
        ),
        itemCount: options.length,
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
