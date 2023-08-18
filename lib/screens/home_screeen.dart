// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_info/model/model.dart';
import 'package:weather_info/services/get_location.dart';
import 'package:weather_info/services/api_services.dart';
import 'package:intl/intl.dart';
import '../constants/strings.dart';

class HomeScreen extends StatefulWidget {
  List<Weather> weatherModel = [];
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

  @override
  void initState() {
    super.initState();
    initLocation();
  }

  initLocation() async {
    await GPS.getPosition(lt, lg);
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('EEEE, d MMMM').format(DateTime.now());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: getCurrentWeather(lt, lg),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            Weather data = snapshot.data as Weather;
            // print(data);
            return Container(
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
                        //City name
                        Text(
                          data.location.name,
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'MavenPro',
                          ),
                        ),
                        //day & date
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: 'MavenPro',
                          ),
                        ),
                        //Icon
                        Image.network(
                          'https:${data.current.condition.icon}',
                          height: size.width * 0.4,
                          width: size.width * 0.4,
                          fit: BoxFit.cover,
                        ),
                        //weather condition
                        Text(
                          data.current.condition.text,
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Hubballi',
                          ),
                        ),
                        //temp
                        Text(
                          '${data.current.tempC.toString()}$degree',
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
                                  Lottie.asset(
                                      'assets/icons/Set 01/d_cloudy.json',
                                      width: size.width * 0.15,
                                      height: size.width * 0.15),
                                  //Clouds
                                  Text(
                                    '${data.current.cloud} %',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Hubballi',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Clouds',
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
                                      'assets/icons/Set 01/humidity (2).png',
                                      width: size.width * 0.15,
                                      height: size.width * 0.14),

                                  //Humidity
                                  Text(
                                    '${data.current.humidity} %',
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
                                  //Wind Direction
                                  Text(
                                    data.current.windDir,
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
                            //Gust
                            Text(
                              '${data.current.gustKph} kp/h',
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

                            //Pressure
                            Text(
                              '${data.current.pressureMb} hpa',
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
                            //UV Index
                            Text(
                              data.current.uv.toString(),
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
                            //Precipitation
                            Text(
                              '${data.current.precipMm} mm',
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
                            //Wind Speed
                            Text(
                              '${data.current.windKph} km/h',
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
                              DateFormat('HH:mm').format(
                                DateTime.parse(data.current.lastUpdated),
                              ),
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
            );
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
