import 'package:flutter/material.dart';
import 'package:juan_giphy/src/features/home/home_page.dart';

class NavigationRoutes {
  NavigationRoutes._();

  static const home = "/";

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      home: (context) => const HomePage(),
    };
  }
}
