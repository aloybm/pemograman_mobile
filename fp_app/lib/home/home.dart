import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp_app/history/history_screen.dart';
import 'package:fp_app/home/weather.dart';
import 'package:fp_app/start_screen/start_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  String? emailAddress;

  @override
  void initState() {
    super.initState();
    if (user != null) {
      for (final providerProfile in user!.providerData) {
        emailAddress = providerProfile.email;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) async {
              if (value == 'History') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryScreen()),
                );
              } else if (value == 'Logout') {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StartScreen()),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return {'History', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: ListTile(
                    leading: choice == 'History'
                        ? const Icon(Icons.history)
                        : const Icon(Icons.logout),
                    title: Text(choice),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (emailAddress != null)
              Text(
                'Welcome, $emailAddress!',
                style: const TextStyle(fontSize: 18),
              ),
            if (emailAddress == null)
              const Text(
                'No email address available',
                style: TextStyle(fontSize: 18),
              ),
            const WeatherApp(),
          ],
        ),
      ),
    );
  }
}
