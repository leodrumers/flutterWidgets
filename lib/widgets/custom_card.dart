import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('My title'),
            leading: Icon(
              Icons.book_online_outlined,
              color: AppTheme.primaryColor,
            ),
            subtitle: Text(
                'Magna ex do Lorem aliqua veniam amet minim. Veniam ex dolore commodo commodo mollit officia qui. Lorem Lorem ut enim tempor quis quis nostrud ea amet nulla dolore.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text('Cancel')),
              TextButton(onPressed: () {}, child: const Text('Ok')),
            ],
          )
        ],
      ),
    );
  }
}
