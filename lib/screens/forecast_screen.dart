import 'package:flutter/material.dart';
import 'package:weather_info/model/weather_model.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key, required List<WeatherModel> weatherModel});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Forecast Screen',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
