import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../constants/strings.dart';
import '../model/model.dart';

class WeatherUICard extends StatelessWidget {
  const WeatherUICard({
    super.key,
    required this.size,
    required this.data,
    required this.date,
  });

  final Size size;
  final Weather data;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
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
              boxShadow: [
                BoxShadow(
                  blurRadius: 9,
                  spreadRadius: 1,
                  offset: Offset(5, 5),
                  color: Colors.black54,
                )
              ]),
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
              Expanded(
                child: Text(
                  data.current.condition.text,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Hubballi',
                  ),
                ),
              ),
              //temp
              Text(
                '${data.current.tempC.toString()}$degree',
                style: const TextStyle(
                  fontSize: 70,
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
                        Lottie.asset('assets/icons/Set 01/d_cloudy.json',
                            width: size.width * 0.15,
                            height: size.width * 0.15),
                        //Clouds
                        Text(
                          '${data.current.cloud} %',
                          style: const TextStyle(
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
                        Image.asset('assets/icons/Set 01/humidity (2).png',
                            width: size.width * 0.15,
                            height: size.width * 0.14),

                        //Humidity
                        Text(
                          '${data.current.humidity} %',
                          style: const TextStyle(
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
                          style: const TextStyle(
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
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
        const SizedBox(height: 5),
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'MavenPro',
                    ),
                  ),
                  const SizedBox(height: 20),
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
                    style: const TextStyle(
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'MavenPro',
                    ),
                  ),
                  const SizedBox(height: 20),
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
                    style: const TextStyle(
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
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'MavenPro',
                    ),
                  ),
                  const SizedBox(height: 20),
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
                    style: const TextStyle(
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
    );
  }
}
