import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fp_app/home/weather_info_card.dart';
import 'package:fp_app/model/weather_model.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  WeatherAppState createState() => WeatherAppState();
}

class WeatherAppState extends State<WeatherApp> {
  String _city = 'Surabaya';
  String _weather = '';
  double _temperature = 0.0;
  double _wind = 0.0;
  int _pressure = 0;
  bool _errorOccurred = false;
  bool _loading = false;

  final TextEditingController _cityController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final User? user = FirebaseAuth.instance.currentUser;
  String? _cityError;

  @override
  void initState() {
    super.initState();
    fetchWeather();
    _cityController.addListener(() => _validateInputForm(_cityController.text));
  }

  void _searchWeather() async {
    FocusScope.of(context).unfocus(); 
    if (_formKey.currentState!.validate()) {
      setState(() {
        _city = _cityController.text;
      });
      await fetchWeather();
      if (!_errorOccurred) {
        await WeatherModel.addWeatherData(
            user!,
            ({
              "city": _city,
              "weather": _weather,
              "temperature": _temperature,
              "wind": _wind,
              "pressure": _pressure,
            }));
      }
    }
  }

  void _validateInputForm(String value) {
    setState(() {
      if (value.isEmpty) {
        _cityError = 'Please enter a city name';
      } else {
        _cityError = null;
      }
    });
  }

  Future<void> fetchWeather() async {
    setState(() {
      _loading = true;
    });

    try {
      final weatherData = await WeatherModel.fetchWeather(_city, context);
      setState(() {
        _errorOccurred = false;
        _loading = false;
        _weather = weatherData['weather'];
        _temperature = weatherData['temperature'];
        _wind = weatherData['wind'];
        _pressure = weatherData['pressure'];
      });
    } catch (e) {
      setState(() {
        _errorOccurred = true;
        _loading = false;
        _weather = 'Error';
        _temperature = 0.0;
        _wind = 0.0;
        _pressure = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Form(
            key: _formKey,
            child: Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: 'Enter city name',
                        errorText: _cityError,
                      ),
                      onChanged: (value) => _validateInputForm(value),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _searchWeather,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('Search'),
                  ),
                ],
              ),
            ),
          ),
          if (_loading) const CircularProgressIndicator(),
          if (!_loading && !_errorOccurred)
            WeatherInfoCard(
              city: _city,
              weather: _weather,
              temperature: _temperature,
              wind: _wind,
              pressure: _pressure,
              errorOccurred: _errorOccurred,
            ),
        ],
      ),
    );
  }
}
