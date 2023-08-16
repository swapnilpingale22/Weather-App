import 'dart:async';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/weather_model.dart';
import 'bottom_navbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List data = [];
  List<WeatherModel> weatherList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadJson();
    });
    super.initState();
  }

  loadJson() async {
    // String myData = await rootBundle.loadString('');
    setState(() {
      // data = json.decode(myData);
      weatherList = data.map((e) => WeatherModel.fromJson(e)).toList();
      weatherList = weatherList;
    });
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavbarScreen(
            weatherModel: weatherList,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff060720),
      body: Center(
        child: Text(
          'Weather Info',
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
