import 'package:flutter/material.dart';
import '../model/weather_model.dart';

class EditWeatherScreen extends StatefulWidget {
  final String docId;
  final String initialCity;

  const EditWeatherScreen(
      {super.key, required this.docId, required this.initialCity});

  @override
  EditWeatherScreenState createState() => EditWeatherScreenState();
}

class EditWeatherScreenState extends State<EditWeatherScreen> {
  late TextEditingController _cityController;
  bool _isLoading = false;
  late String _currentCity;
  String? _cityError;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController(text: widget.initialCity);
    _currentCity = widget.initialCity;
    _cityController.addListener(() => _validateCity(_cityController.text));
  }

  void _validateCity(String value) {
    setState(() {
      if (value.isEmpty) {
        _cityError = 'Please enter a city name';
      } else {
        _cityError = null;
      }
    });
  }

  Future<void> _updateCity() async {
    FocusScope.of(context).unfocus();
    if (_cityError != null || _cityController.text.isEmpty) {
      _validateCity(_cityController.text);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final success = await _fetchAndStoreWeather(_cityController.text);
      if (success) {
        await WeatherModel.updateWeatherData(widget.docId, {
          'city': _cityController.text,
        });
        setState(() {
          _currentCity = _cityController.text;
        });
        WeatherModel.showDialogApp(
          context,
          "Success",
          "Successfully updated data for city ${_cityController.text}.",
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<bool> _fetchAndStoreWeather(String city) async {
    try {
      final weatherData = await WeatherModel.fetchWeather(city, context);
      await WeatherModel.updateWeatherData(widget.docId, weatherData);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current City: $_currentCity',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'New City',
                errorText: _cityError,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _updateCity,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Update City',
                          style: TextStyle(fontSize: 18.0),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
