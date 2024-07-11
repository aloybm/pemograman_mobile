import 'package:flutter/material.dart';
import 'weather_info_row.dart';

class WeatherInfoCard extends StatelessWidget {
  final String city;
  final String weather;
  final double temperature;
  final double wind;
  final int pressure;
  final bool errorOccurred;

  const WeatherInfoCard({
    super.key,
    required this.city,
    required this.weather,
    required this.temperature,
    required this.wind,
    required this.pressure,
    required this.errorOccurred,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            WeatherInfoRow(
              title: 'Temperature',
              content: '$temperature°C',
              iconData: Icons.thermostat_outlined,
            ),
            WeatherInfoRow(
              title: 'Weather',
              content: weather,
              iconData: Icons.cloud_outlined,
            ),
            WeatherInfoRow(
              title: 'Wind',
              content: '$wind m/s',
              iconData: Icons.air_outlined,
            ),
            WeatherInfoRow(
              title: 'Pressure',
              content: '$pressure hPa',
              iconData: Icons.speed_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
