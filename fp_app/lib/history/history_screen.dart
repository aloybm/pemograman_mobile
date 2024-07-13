  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fp_app/history/weather_dialog.dart';

import '../model/weather_model.dart';
import 'edit_weather_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> _deleteWeather(String docId) async {
    try {
      await WeatherModel.deleteWeatherData(context, docId);
    } catch (e) {
      WeatherModel.showDialogApp(context, "Error", "Error delete for this id");
    }
  }

  void _editWeather(String docId, Map<String, dynamic> data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditWeatherScreen(docId: docId, initialCity: data['city']),
      ),
    );
  }

  void _showWeatherDetails(BuildContext context, DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WeatherDetailsDialog(
          data: data,
          onEdit: () {
            Navigator.pop(context);
            _editWeather(doc.id, data);
          },
          onDelete: () async {
            Navigator.pop(context);
            await _deleteWeather(doc.id);
           
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users_weather')
            .where('user', isEqualTo: user!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: () => _showWeatherDetails(context, doc),
                  child: ListTile(
                    title:
                        Text(doc['city'], style: const TextStyle(fontSize: 18)),
                    subtitle: const Text('Tap for details'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
