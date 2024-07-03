import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp_app/login/login_screen.dart';
import 'package:fp_app/register/register_screen.dart';
import 'package:fp_app/start_screen/start_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var activeScreen = 'welcome-screen';

  void registerPage() {
    setState(() {
      activeScreen = 'register-screen';
    });
  }

  void loginPage() {
    setState(() {
      activeScreen = 'login-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(registerPage, loginPage);
    if (activeScreen == 'register-screen') {
      screenWidget = RegisterScreen(onRegister: loginPage);
    } else if (activeScreen == 'login-screen') {
      screenWidget = LoginScreen();
    }
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget),
      ),
    );
  }
}

