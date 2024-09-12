import 'package:flutter/material.dart';
import 'package:news_app/core/page._route_names.dart';
import 'package:news_app/features/modules/layout/lay_out.dart';
import 'package:news_app/features/modules/splash_Screen/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case PageRouteNames.layout:
        return MaterialPageRoute(
            builder: (context) => const LayOut(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
    }
  }
}
