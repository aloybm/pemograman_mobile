import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp_app/home/home.dart';
import 'package:fp_app/login/login_screen.dart';
import 'package:http/http.dart' as http;

class WeatherModel {
  static const String _apiKey = 'c9140716115fb8ffb145a849d60c68a4';
  static final CollectionReference weatherCollection =
      FirebaseFirestore.instance.collection('users_weather');

  static Future<Map<String, dynamic>> fetchWeather(
      String city, BuildContext context) async {
    final Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey&units=metric');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
          'city': city,
          'weather': data['weather'][0]['main'],
          'temperature': data['main']['temp'],
          'wind': data['wind']['speed'],
          'pressure': data['main']['pressure'],
        };
      } else if (response.statusCode == 404) {
        throw Exception('City not found');
      } else {
        throw Exception(
            'Error fetching weather data: ${response.reasonPhrase}');
      }
    } catch (e) {
      showDialogApp(context, 'Weather Error', 'City not found for $city');
      throw Exception('City not found');
    }
  }

  static Future<void> addWeatherData(
      BuildContext context, User user, Map<String, dynamic> weatherData) async {
    try {
      weatherData['user'] = user.uid;
      await weatherCollection.add(weatherData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Weather data added successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding weather data: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  static Future<void> updateWeatherData(
      String docId, Map<String, dynamic> weatherData) async {
    try {
      await weatherCollection.doc(docId).update(weatherData);
    } catch (e) {
      throw Exception('Error updating weather data: $e');
    }
  }

   static Future<void> deleteWeatherData(BuildContext context, String docId) async {
    try {
      await weatherCollection.doc(docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Weather data deleted successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
       throw Exception('Error deleting weather data: $e');
    }
  }

  static Future<DocumentSnapshot> getWeatherData(String docId) async {
    try {
      DocumentSnapshot doc = await weatherCollection.doc(docId).get();
      return doc;
    } catch (e) {
      throw Exception('Error getting weather data: $e');
    }
  }

  static Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      showSuccessDialog(
          context,
          'Success',
          'Login successful! Welcome back, ${credential.user?.email}',
          const HomeScreen());
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      } else {
        errorMessage = "Please make sure your email and password are correct";
      }
      showDialogApp(context, "Error", errorMessage);
    }
  }

  static Future<void> register(
      BuildContext context, String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      showSuccessDialog(
          context,
          'Success',
          'Registration successful! Please Login, ${credential.user?.email}',
          const LoginScreen());
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      } else {
        errorMessage = 'An error occurred. Please try again later.';
      }
      showDialogApp(context, "Error", errorMessage);
    }
  }

  static void showDialogApp(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showSuccessDialog(
      BuildContext context, String title, String message, Widget destination) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => destination),
                );
              },
              child: const Text('Next'),
            ),
          ],
        );
      },
    );
  }
}
