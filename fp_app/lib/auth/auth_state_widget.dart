import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp_app/home/home.dart';
import 'package:fp_app/start_screen/start_screen.dart';

class AuthStateWidget extends StatefulWidget {
  const AuthStateWidget({super.key});

  @override
  AuthStateWidgetState createState() => AuthStateWidgetState();

  static of(BuildContext context) {}
}

class AuthStateWidgetState extends State<AuthStateWidget> {
  User? _user;

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      setState(() {
        _user = FirebaseAuth.instance.currentUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const StartScreen();
    } else {
      return const HomeScreen();
    }
  }
}
