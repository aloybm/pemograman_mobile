import 'package:flutter/material.dart';
import 'package:fp_app/circleimg.dart';
import 'package:fp_app/login/login_screen.dart';
import 'package:fp_app/register/register_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomCircleImg(
              imagePath: 'assets/img/weather_img.jpg',
              radius: 80,
            ),
            Text(
              'Welcome to the Weather App!',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold
                  ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  icon: const Icon(Icons.login),
                  label: const Text('Login'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(120, 48)),
                  ),
                ),
                const SizedBox(width: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  icon: const Icon(Icons.app_registration),
                  label: const Text('Register'),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(120, 48)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
