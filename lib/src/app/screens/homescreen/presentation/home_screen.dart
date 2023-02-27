import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kagajpatra/src/app/screens/auth/login/presentation/login_screen.dart';
import 'package:kagajpatra/src/app/screens/homescreen/landingscreen/presentation/landings_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const LandingScreen();
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error!"));
              } else {
                return LoginScreen();
              }
            }));
  }
}
