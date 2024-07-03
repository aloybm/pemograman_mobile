import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.registerPage, this.loginPage, {Key? key}) : super(key: key);

  final void Function() registerPage;
  final void Function() loginPage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          const SizedBox(height: 80),

          const Text(
            'Welcome to the App!',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),

          const SizedBox(height: 30),

          OutlinedButton.icon(
            onPressed: loginPage,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.login),
            label: const Text('Login'),
          ),

          OutlinedButton.icon(
            onPressed: registerPage,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.app_registration),
            label: const Text('Register'),
          ),
        ],
      ),
    );
  }
}
