import 'package:components/screens/input_screen.dart';
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
        icon: Icons.list),
    MenuOption(
        route: 'avatar',
        name: 'Avatar Screen',
        screen: const AvatarScreen(),
        icon: Icons.supervised_user_circle_outlined),
    MenuOption(
        route: 'animated',
        name: 'Animated Screen',
        screen: const AnimatedScreen(),
        icon: Icons.run_circle_outlined),
    MenuOption(
        route: 'inputs',
        name: 'Input Screen',
        screen: const InputScreen(),
        icon: Icons.incomplete_circle_outlined),
    MenuOption(
        route: 'slider',
        name: 'Slider Screen',
        screen: const SliderScreen(),
        icon: Icons.slideshow),
    MenuOption(
        route: 'listviewbuilder',
        name: 'Listview Builder Screen',
        screen: const ListViewBuilderScreen(),
        icon: Icons.build_circle_outlined),
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
      builder: (context) => const HomeScreen(),
    );
  }
}
