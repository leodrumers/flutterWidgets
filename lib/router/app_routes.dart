import 'package:flutter/material.dart';

import '../screens/index.dart';
import '../models/index.dart';

class AppRoutes {
  static const initialRoute = 'Home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'alert',
        name: 'Alert widget',
        screen: const AlertScreen(),
        icon: Icons.alarm),
    MenuOption(
        route: 'card',
        name: 'Card Screen',
        screen: const CardScreen(),
        icon: Icons.card_giftcard),
    MenuOption(
        route: 'listView',
        name: 'Listview Screen',
        screen: const ListviewScreen(),
        icon: Icons.list)
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> routes = {};

    for (final option in menuOptions) {
      routes.addAll({option.route: (context) => option.screen});
    }

    return routes;
  }

  // static Map<String, Widget Function(BuildContext)> routes = {
  //   'home': (context) => const HomeScreen(),
  //   'alert': (context) => const AlertScreen(),
  //   'card': (context) => const CardScreen(),
  //   'listView': (context) => const ListviewScreen(),
  // };

  static Route<dynamic> ongenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
