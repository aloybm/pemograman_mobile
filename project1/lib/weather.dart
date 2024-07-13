import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sec_app/citysearch.dart';
import 'package:sec_app/cardweather.dart';
import 'package:sec_app/weatherdialog.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String _city = 'Surabaya';
  String _weather = '';
  double _temperature = 0.0;
  double _wind = 0.0;
  int _pressure = 0;

  void _handleCityChanged(String value) {
    setState(() {
      _city = value;
    });
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=&units=metric');
    final response = await http.get(url);
    final data = json.decode(response.body);
    setState(() {
      _weather = data['weather'][0]['main'];
      _temperature = data['main']['temp'];
      _wind = data['wind']['speed'];
      _pressure = data['main']['pressure'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  void _showWeatherDialog(String title, String content) {
    WeatherDialog.show(context, title, content);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CitySearch(onCityChanged: _handleCityChanged),
        Text(
          _city,
          style: const TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            WeatherCard(
              title: 'Weather',
              content: _weather,
              onTap: () {
                _showWeatherDialog('Weather', _weather);
              },
            ),
            WeatherCard(
              title: '"Temperature"',
              content: '$_temperature°C',
              onTap: () {
                _showWeatherDialog('Temperature', '$_temperature°C');
              },
            ),
            WeatherCard(
              title: 'Wind',
              content: '$_wind m/s',
              onTap: () {
                _showWeatherDialog('Wind', '$_wind m/s');
              },
            ),
            WeatherCard(
              title: 'Pressure',
              content: '$_pressure hpa',
              onTap: () {
                _showWeatherDialog('Pressure', '$_pressure hpa');
              },
            ),
          ],
        ),
      ],
    );
  }
}
