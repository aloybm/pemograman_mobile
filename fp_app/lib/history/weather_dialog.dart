import 'package:flutter/material.dart';

class WeatherDetailsDialog extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const WeatherDetailsDialog({
    super.key,
    required this.data,
    required this.onEdit,
    required this.onDelete,
  });

  Widget _buildWeatherInfo(String title, String content, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                size: 20.0,
              ),
              const SizedBox(width: 10.0),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(content),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(data['city'], style: TextStyle(fontWeight: FontWeight.bold),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWeatherInfo('Weather', data['weather'], Icons.cloud_outlined),
          _buildWeatherInfo('Temperature', '${data['temperature']}°C', Icons.thermostat_outlined),
          _buildWeatherInfo('Wind', '${data['wind']} m/s', Icons.air_outlined),
          _buildWeatherInfo('Pressure', '${data['pressure']} hPa', Icons.speed_outlined),
        ],
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.pop(context); 
          },
          icon: const Icon(Icons.close),
          label: const Text('Close'),
        ),
        TextButton.icon(
          onPressed: onEdit,
          icon: const Icon(Icons.edit),
          label: const Text('Edit'),
        ),
        TextButton.icon(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
        ),
      ],
    );
  }
}
