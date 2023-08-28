import 'package:flutter/material.dart';
import 'package:news_app/category_screen/category_screen.dart';
import 'package:news_app/home_screen/home_screen.dart';
import 'package:news_app/home_screen_details/home_screen_details.dart';
import 'package:news_app/screens/splash_screen/splash_screen.dart';
import 'package:news_app/utisl/Routes/route_names.dart';

class AppRoute {
  static Route<dynamic> routeSettings(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteNames.ssScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteNames.homeScreenDetails:
        return MaterialPageRoute(
            builder: (_) => HomeScreenDetails(
                  title: "",
                  image: "",
                  description: "",
                  source: "",
                  authorName: "",
                ));
      case RouteNames.categoriesScreenetails:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route founds for ${settings.name}"),
                  ),
                ));
    }
  }
}
