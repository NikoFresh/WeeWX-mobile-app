import '../config.dart';
import 'json.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

Future<WeatherData> getWeatherData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final websiteUrl = prefs.getString('weatherUrl') ?? weatherDataUrl;
  print(websiteUrl);
  final response = await http.get(
    '$websiteUrl',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return weatherDataFromJson(response.body);
}
