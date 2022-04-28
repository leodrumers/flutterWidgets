import 'package:components/router/app_routes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter components'),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  menuOptions[index].icon,
                ),
                title: Text(menuOptions[index].name),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  Navigator.pushNamed(context, menuOptions[index].route);
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: menuOptions.length),
    );
  }
}
