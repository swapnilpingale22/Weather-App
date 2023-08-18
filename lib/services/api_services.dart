import 'package:http/http.dart' as http;
import 'package:weather_info/model/model.dart';
import '../constants/strings.dart';

getCurrentWeather(latitude, longitude) async {
  String currentWeatherUrl =
      'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude&aqi=no';
  var res = await http.get(Uri.parse(currentWeatherUrl));

  if (res.statusCode == 200) {
    var data = weatherFromJson(res.body.toString());
    print('Current data received');
    return data;
  }
}
