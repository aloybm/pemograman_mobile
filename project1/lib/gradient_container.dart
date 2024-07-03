import 'package:flutter/material.dart';
import 'package:sec_app/weather.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  const GradientContainer.green({super.key})
      : color1 = Colors.lightGreen,
        color2 = Colors.greenAccent;

  const GradientContainer.orange({super.key})
      : color1 = Colors.orange,
        color2 = Colors.deepOrange;

  const GradientContainer.darkgreen({super.key})
      : color1 = const Color.fromARGB(255, 171, 244, 171),
        color2 = Colors.green;

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color1,
            color2,
          ]),
        ),
        child: const Center(child: WeatherApp()));
  }
}
