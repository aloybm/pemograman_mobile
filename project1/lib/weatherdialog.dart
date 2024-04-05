import 'package:flutter/material.dart';

class WeatherDialog {
  static void show(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.green.shade900, 
          title: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), 
          ),
          content: Text(
            content,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
