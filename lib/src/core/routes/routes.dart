import 'package:flutter/material.dart';
import 'package:kagajpatra/src/app/screens/auth/login/presentation/login_screen.dart';
import 'package:kagajpatra/src/app/screens/auth/signup/presentation/signup_screen.dart';
import 'package:kagajpatra/src/app/screens/homescreen/landingscreen/presentation/landings_screen.dart';
import 'package:kagajpatra/src/app/screens/homescreen/presentation/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "signUp":
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case "login":
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case "landing":
        return MaterialPageRoute(builder: (_) => const LandingScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
