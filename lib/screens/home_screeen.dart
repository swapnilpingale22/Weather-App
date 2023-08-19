// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_info/model/model.dart';
import 'package:weather_info/screens/weather_ui_card.dart';
import 'package:weather_info/services/get_location.dart';
import 'package:weather_info/services/api_services.dart';
import 'package:intl/intl.dart';
import '../constants/strings.dart';

class HomeScreen extends StatefulWidget {
  final List<Weather> weatherModel;
  HomeScreen({
    Key? key,
    required this.weatherModel,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double lt = 21.04;
  double lg = 75.06;
  bool isLoaded = true;

  @override
  void initState() {
    super.initState();
    initLocation();
    setState(() {
      isLoaded = false;
    });
  }

  initLocation() async {
    await GPS.getPosition(context, lt, lg, isLoaded);
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('EEEE, d MMMM').format(DateTime.now());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: isLoaded
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder(
              future: getCurrentWeather(lt, lg),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  Weather data = snapshot.data as Weather;
                  // print(data);
                  return WeatherUICard(size: size, data: data, date: date);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  print("Snapshot error: ${snapshot.error}");
                  return const Center(
                    child: Text('No data available.'),
                  );
                }
              },
            ),
    );
  }
}
