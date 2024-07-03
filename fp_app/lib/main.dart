import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fp_app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(
    const MyApp(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
