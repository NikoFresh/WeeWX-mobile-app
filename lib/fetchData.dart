import 'package:weewx_mobile_app/config.dart';

import 'package:weewx_mobile_app/json.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String url = weatherData_url;

Future<WeatherData> getWeatherData() async{
  final response = await http.get('$url');
  return weatherDataFromJson(response.body);
}