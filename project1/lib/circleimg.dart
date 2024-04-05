import 'package:flutter/material.dart';

class CustomCircleImg extends StatelessWidget {
  final String imagePath;
  final double radius;

  const CustomCircleImg({
    super.key,
    required this.imagePath,
    this.radius = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
