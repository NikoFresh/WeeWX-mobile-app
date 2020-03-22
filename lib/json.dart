// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

WeatherData weatherDataFromJson(String str) => WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
    String title;
    String location;
    String time;
    String lat;
    String lon;
    String alt;
    String hardware;
    String uptime;
    String serverUptime;
    String weewxVersion;
    Current current;
    SinceMidnight sinceMidnight;
    SinceMidnight yesterday;
    Almanac almanac;

    WeatherData({
        this.title,
        this.location,
        this.time,
        this.lat,
        this.lon,
        this.alt,
        this.hardware,
        this.uptime,
        this.serverUptime,
        this.weewxVersion,
        this.current,
        this.sinceMidnight,
        this.yesterday,
        this.almanac,
    });

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        title: json["title"],
        location: json["location"],
        time: json["time"],
        lat: json["lat"],
        lon: json["lon"],
        alt: json["alt"],
        hardware: json["hardware"],
        uptime: json["uptime"],
        serverUptime: json["serverUptime"],
        weewxVersion: json["weewxVersion"],
        current: Current.fromJson(json["current"]),
        sinceMidnight: SinceMidnight.fromJson(json["sinceMidnight"]),
        yesterday: SinceMidnight.fromJson(json["yesterday"]),
        almanac: Almanac.fromJson(json["almanac"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "location": location,
        "time": time,
        "lat": lat,
        "lon": lon,
        "alt": alt,
        "hardware": hardware,
        "uptime": uptime,
        "serverUptime": serverUptime,
        "weewxVersion": weewxVersion,
        "current": current.toJson(),
        "sinceMidnight": sinceMidnight.toJson(),
        "yesterday": yesterday.toJson(),
        "almanac": almanac.toJson(),
    };
}

class Almanac {
    Sun sun;
    Moon moon;

    Almanac({
        this.sun,
        this.moon,
    });

    factory Almanac.fromJson(Map<String, dynamic> json) => Almanac(
        sun: Sun.fromJson(json["sun"]),
        moon: Moon.fromJson(json["moon"]),
    );

    Map<String, dynamic> toJson() => {
        "sun": sun.toJson(),
        "moon": moon.toJson(),
    };
}

class Moon {
    String phase;
    String fullness;

    Moon({
        this.phase,
        this.fullness,
    });

    factory Moon.fromJson(Map<String, dynamic> json) => Moon(
        phase: json["phase"],
        fullness: json["fullness"],
    );

    Map<String, dynamic> toJson() => {
        "phase": phase,
        "fullness": fullness,
    };
}

class Sun {
    String sunrise;
    String sunset;

    Sun({
        this.sunrise,
        this.sunset,
    });

    factory Sun.fromJson(Map<String, dynamic> json) => Sun(
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Current {
    String outTemp;
    String windchill;
    String dewpoint;
    String humidity;
    String barometer;
    String windSpeed;
    String windGust;
    String rainRate;

    Current({
        this.outTemp,
        this.windchill,
        this.dewpoint,
        this.humidity,
        this.barometer,
        this.windSpeed,
        this.windGust,
        this.rainRate,
    });

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        outTemp: json["outTemp"],
        windchill: json["windchill"],
        dewpoint: json["dewpoint"],
        humidity: json["humidity"],
        barometer: json["barometer"],
        windSpeed: json["windSpeed"],
        windGust: json["windGust"],
        rainRate: json["rainRate"],
    );

    Map<String, dynamic> toJson() => {
        "outTemp": outTemp,
        "windchill": windchill,
        "dewpoint": dewpoint,
        "humidity": humidity,
        "barometer": barometer,
        "windSpeed": windSpeed,
        "windGust": windGust,
        "rainRate": rainRate,
    };
}

class SinceMidnight {
    String tempMaxValue;
    String tempMaxTime;
    String tempMinValue;
    String tempMinTime;
    String windchillMinValue;
    String windchillMinTime;
    String humidityMaxValue;
    String humidityMaxTime;
    String humidityMinValue;
    String humidityMinTime;
    String dewpointMaxValue;
    String dewpointMaxTime;
    String dewpointMinValue;
    String dewpointMinTime;
    String barometerMaxValue;
    String barometerMaxTime;
    String barometerMinValue;
    String barometerMinTime;
    String rainSum;
    String rainRateMaxValue;
    String rainRateMaxTime;
    String windMaxValue;
    String windMaxTime;
    String windAvg;

    SinceMidnight({
        this.tempMaxValue,
        this.tempMaxTime,
        this.tempMinValue,
        this.tempMinTime,
        this.windchillMinValue,
        this.windchillMinTime,
        this.humidityMaxValue,
        this.humidityMaxTime,
        this.humidityMinValue,
        this.humidityMinTime,
        this.dewpointMaxValue,
        this.dewpointMaxTime,
        this.dewpointMinValue,
        this.dewpointMinTime,
        this.barometerMaxValue,
        this.barometerMaxTime,
        this.barometerMinValue,
        this.barometerMinTime,
        this.rainSum,
        this.rainRateMaxValue,
        this.rainRateMaxTime,
        this.windMaxValue,
        this.windMaxTime,
        this.windAvg,
    });

    factory SinceMidnight.fromJson(Map<String, dynamic> json) => SinceMidnight(
        tempMaxValue: json["tempMaxValue"],
        tempMaxTime: json["tempMaxTime"],
        tempMinValue: json["tempMinValue"],
        tempMinTime: json["tempMinTime"],
        windchillMinValue: json["windchillMinValue"],
        windchillMinTime: json["windchillMinTime"],
        humidityMaxValue: json["humidityMaxValue"],
        humidityMaxTime: json["humidityMaxTime"],
        humidityMinValue: json["humidityMinValue"],
        humidityMinTime: json["humidityMinTime"],
        dewpointMaxValue: json["dewpointMaxValue"],
        dewpointMaxTime: json["dewpointMaxTime"],
        dewpointMinValue: json["dewpointMinValue"],
        dewpointMinTime: json["dewpointMinTime"],
        barometerMaxValue: json["barometerMaxValue"],
        barometerMaxTime: json["barometerMaxTime"],
        barometerMinValue: json["barometerMinValue"],
        barometerMinTime: json["barometerMinTime"],
        rainSum: json["rainSum"],
        rainRateMaxValue: json["rainRateMaxValue"],
        rainRateMaxTime: json["rainRateMaxTime"],
        windMaxValue: json["windMaxValue"],
        windMaxTime: json["windMaxTime"],
        windAvg: json["windAvg"],
    );

    Map<String, dynamic> toJson() => {
        "tempMaxValue": tempMaxValue,
        "tempMaxTime": tempMaxTime,
        "tempMinValue": tempMinValue,
        "tempMinTime": tempMinTime,
        "windchillMinValue": windchillMinValue,
        "windchillMinTime": windchillMinTime,
        "humidityMaxValue": humidityMaxValue,
        "humidityMaxTime": humidityMaxTime,
        "humidityMinValue": humidityMinValue,
        "humidityMinTime": humidityMinTime,
        "dewpointMaxValue": dewpointMaxValue,
        "dewpointMaxTime": dewpointMaxTime,
        "dewpointMinValue": dewpointMinValue,
        "dewpointMinTime": dewpointMinTime,
        "barometerMaxValue": barometerMaxValue,
        "barometerMaxTime": barometerMaxTime,
        "barometerMinValue": barometerMinValue,
        "barometerMinTime": barometerMinTime,
        "rainSum": rainSum,
        "rainRateMaxValue": rainRateMaxValue,
        "rainRateMaxTime": rainRateMaxTime,
        "windMaxValue": windMaxValue,
        "windMaxTime": windMaxTime,
        "windAvg": windAvg,
    };
}
