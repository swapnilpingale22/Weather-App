// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
              height: size.height * 0.75,
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
                    'Mumbai',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'MavenPro',
                    ),
                  ),
                  Text(
                    'Thursday, 17 August',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'MavenPro',
                    ),
                  ),
                  Lottie.asset(
                    'assets/icons/Set 01/n_cloudy.json',
                    height: size.width * 0.4,
                    width: size.width * 0.4,
                  ),
                  Text(
                    'Sunny',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Hubballi',
                    ),
                  ),
                  Text(
                    '30°',
                    style: TextStyle(
                      fontSize: 75,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      fontFamily: 'Hubballi',
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Lottie.asset('assets/icons/Set 01/wind_speed.json',
                                width: size.width * 0.15,
                                height: size.width * 0.15),
                            Text(
                              '17.1 Km/h',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Wind',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14,
                                fontFamily: 'MavenPro',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset('assets/icons/Set 01/humidity (2).png',
                                width: size.width * 0.15,
                                height: size.width * 0.14),
                            Text(
                              '81 %',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14,
                                fontFamily: 'MavenPro',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/icons/Set 01/wind-direction.png',
                              width: size.width * 0.15,
                              height: size.width * 0.15,
                            ),
                            Text(
                              'SE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Hubballi',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Wind Direction',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14,
                                fontFamily: 'MavenPro',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Gust',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      Text(
                        '32.0 kp/h',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Pressure',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      Text(
                        '1025.0 hpa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'UV',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      Text(
                        '1.0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Precipitation',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      Text(
                        '0.0 mm',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      Text(
                        '19.01 km/h',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Last Updated',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                      Text(
                        '${DateTime.now().hour}:${DateTime.now().minute}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'MavenPro',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
