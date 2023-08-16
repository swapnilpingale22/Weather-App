// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/weather_model.dart';

class HomeScreen extends StatefulWidget {
  List<WeatherModel> weatherModel = [];
  HomeScreen({
    super.key,
    required this.weatherModel,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.70,
              width: size.width,
              padding: const EdgeInsets.only(top: 30),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff955cd1),
                    Color(0xff3fa2fa),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.25, 1],
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Amalner',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'MavenPro',
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Wednesday, 16 August',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'MavenPro',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
