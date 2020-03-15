import 'json.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String url = 'https://www.meteocalalzodicadore.altervista.org/daily.json';

Future<WeatherData> getWeatherData() async{
  final response = await http.get('$url');
  return weatherDataFromJson(response.body);
}