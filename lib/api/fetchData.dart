import '../config.dart';
import 'json.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<WeatherData> getWeatherData() async{
  final response = await http.get('$weatherDataUrl', headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },);
  return weatherDataFromJson(response.body);
}