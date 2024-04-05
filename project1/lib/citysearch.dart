import "package:flutter/material.dart";
import "package:sec_app/circleimg.dart";

class CitySearch extends StatefulWidget {
  final Function(String) onCityChanged;
  const CitySearch({super.key, required this.onCityChanged});

  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
     
      child: Column(
        children: [
          const CustomCircleImg(
            imagePath: 'assets/img/weather_img.jpg',
            radius: 80,
          ),
          const SizedBox(height: 20), // Mengatur jarak antara gambar dan TextField
          TextField(
            controller: myController,
            onChanged: widget.onCityChanged,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18, // Ukuran font teks
              fontWeight: FontWeight.bold, // Berat teks
            ),
            decoration: InputDecoration(
              hintText: 'Enter city name', // Hint text
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)), // Style hint text
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10), // Mengatur borderRadius
                borderSide: BorderSide.none, // Menghilangkan border
              ),
              filled: true,
              fillColor: Color.fromARGB(255, 36, 73, 30).withOpacity(0.1), // Warna latar belakang TextField
              contentPadding: const EdgeInsets.symmetric(vertical: 12), // Padding konten dalam TextField
            ),
          ),
        ],
      ),
    );
  }
}