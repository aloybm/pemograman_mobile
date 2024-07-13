import 'package:flutter/material.dart';
import 'package:rolldiceapp/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: GradientContainer([
        Color.fromARGB(228, 209, 156, 156),
        Color.fromARGB(173, 122, 10, 10)
      ])),
    ),
  );
}