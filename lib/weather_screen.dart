import 'package:flutter/material.dart';
import 'weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.weatherService});

  final WeatherService weatherService;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double? temp;
  String? weatherIcon;
  String? cityName;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    setState(() {
      temp = widget.weatherService.temperature;
      weatherIcon = widget.weatherService.weatherIcon;
      cityName = widget.weatherService.cityName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  image: NetworkImage(
                      'https://openweathermap.org/img/wn/$weatherIcon@2x.png')),
              Text(
                cityName != null ? cityName! : 'kosong',
              ),
              Text(
                '${temp != null ? temp!.toString() : 'kosong'} °C',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
