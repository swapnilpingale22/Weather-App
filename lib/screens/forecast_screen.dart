import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_info/screens/weather_ui_card.dart';
import '../constants/strings.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import '../model/model.dart' as mod;

class ForecastScreen extends StatefulWidget {
  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  var selectedCityName;
  var latitude;
  var longitude;
  var data;

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('EEEE, d MMMM').format(DateTime.now());
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 76, 79, 179),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontStyle: FontStyle.italic),
                    onChanged: (value) {
                      setState(() {
                        selectedCityName = value;
                      });
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_on_sharp),
                      suffixIcon: Icon(Icons.search),
                      labelText: 'Search City',
                      labelStyle: TextStyle(
                        fontFamily: 'MavenPro',
                        color: Colors.white,
                      ),
                      hintText: 'Eg. Mumbai',
                      hintStyle: TextStyle(
                        fontFamily: 'MavenPro',
                        color: Colors.white,
                      ),
                      helperText: 'Type city name and click on result',
                      helperStyle: TextStyle(
                        fontFamily: 'MavenPro',
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(13.0))),
                    ),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await getCitySuggestions(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      title: Text(suggestion,
                          style: const TextStyle(
                            fontFamily: 'MavenPro',
                          )),
                    );
                  },
                  onSuggestionSelected: (suggestion) async {
                    await getCoordinatesFromCityName(suggestion);
                    setState(() {
                      selectedCityName = suggestion;
                    });
                    await getWeather(latitude, longitude);
                  },
                ),
              ),
              if (latitude != null && longitude != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      //////////////////////////////////////////////////////////////////////////

                      FutureBuilder(
                        future: getWeather(latitude, longitude),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasData) {
                            mod.Weather data = snapshot.data as mod.Weather;

                            ///////////////////////////////////////////////////////////////////////////

                            return WeatherUICard(
                                size: size, data: data, date: date);
                            //  Column(
                            //   children: [
                            //     Text(
                            //       'Weather of city: ${data.location.name}',
                            //       style: const TextStyle(
                            //         fontSize: 24,
                            //         fontWeight: FontWeight.bold,
                            //         fontFamily: 'MavenPro',
                            //       ),
                            //     ),
                            //     Text(
                            //       'Weather condition: ${data.current.condition.text}',
                            //       style: const TextStyle(
                            //         fontSize: 24,
                            //         fontWeight: FontWeight.bold,
                            //         fontFamily: 'MavenPro',
                            //       ),
                            //     ),
                            //     Text(
                            //       'Temp: ${data.current.tempC}$degree',
                            //       style: const TextStyle(
                            //         fontSize: 24,
                            //         fontWeight: FontWeight.bold,
                            //         fontFamily: 'MavenPro',
                            //       ),
                            //     ),
                            //     Image.network(
                            //       'https:${data.current.condition.icon}',
                            //       fit: BoxFit.cover,
                            //       height: 100,
                            //       width: 100,
                            //     ),
                            //   ],
                            // );

                            //////////////////////////////////////////////////////////////
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
                      /////////////////////////////////////////////////////////////////////////
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> getCitySuggestions(String pattern) async {
    const apiKey = 'swapnilpingale';
    const maxRows = 4;

    final response = await http.get(Uri.parse(
        'http://api.geonames.org/searchJSON?q=$pattern&maxRows=$maxRows&username=$apiKey'));

    if (response.statusCode == 200) {
      final List<dynamic> cities = json.decode(response.body)['geonames'];
      List<String> cityNames =
          cities.map((city) => city['name'].toString()).toList();
      return cityNames;
    } else {
      throw Exception('Failed to load city suggestions');
    }
  }

  Future<void> getCoordinatesFromCityName(String cityName) async {
    try {
      List<Location> locations = await locationFromAddress(cityName);

      if (locations != null && locations.isNotEmpty) {
        Location location = locations[0];
        setState(() {
          latitude = location.latitude;
          longitude = location.longitude;
        });
      } else {
        print('No locations found for the given city name');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  getWeather(latitude, longitude) async {
    String url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude&aqi=no';
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var data = mod.weatherFromJson(res.body.toString());
      print('New data received');
      return data;
    }
  }
}
