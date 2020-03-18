import 'package:flutter/material.dart';
import 'package:weewx_mobile_app/fetchData.dart';
import 'package:weewx_mobile_app/json.dart';
import 'package:weewx_mobile_app/config.dart';
import 'generated/l10n.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Weewx weather app',
        theme: ThemeData(),
        home: Home());
  }
}

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131825),
      body: FutureBuilder<WeatherData>(
          future: getWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }

              return SafeArea(
                  child: ListView(
                padding: const EdgeInsets.all(15.0),
                children: [
                  /// Title
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${snapshot.data.location} ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00c2c2),
                            fontSize: 20.0,
                          ),
                        ),
                        TextSpan(
                          text: '\n${snapshot.data.time}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFE5E5E5),
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                  ),

                  /// WEBCAM
                  imageWidget(webcamUrl),

                  /// Current weather
                  Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Container(
                        color: const Color(0xFF2D3446),
                        child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        S.of(context).currentTitle,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          S.of(context).currentTemp +
                                              '${snapshot.data.current.outTemp} °C',
                                          style: TextStyle(
                                            color: const Color(0xFFE5E5E5),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        S.of(context).currentHumidity +
                                            '${snapshot.data.current.humidity}',
                                        style: TextStyle(
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          S.of(context).currentWind +
                                              '${snapshot.data.current.windSpeed}',
                                          style: TextStyle(
                                            color: const Color(0xFFE5E5E5),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        S.of(context).currentRainRate +
                                            '${snapshot.data.current.rainRate}',
                                        style: TextStyle(
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          S.of(context).currentBarometer +
                                              '${snapshot.data.current.barometer}',
                                          style: TextStyle(
                                            color: const Color(0xFFE5E5E5),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        S.of(context).currentWindChill +
                                            '${snapshot.data.current.windchill} °C',
                                        style: TextStyle(
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),

                  /// Since midnight
                  Container(
                      color: Colors.transparent,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          color: const Color(0xFF2D3446),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    child: Text(
                                      S.of(context).sinceMNTitle,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFFE5E5E5),
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          S.of(context).sinceMNTempMax,
                                          style: TextStyle(
                                            color: const Color(0xFFE5E5E5),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.sinceMidnight.tempMaxValue} °C',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFFE5E5E5),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.sinceMidnight.tempMaxTime}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFFE5E5E5),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        S.of(context).sinceMNTempMin,
                                        style: TextStyle(
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data.sinceMidnight.tempMinValue} °C',
                                              style: TextStyle(
                                                color: const Color(0xFFE5E5E5),
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data.sinceMidnight.tempMinTime}',
                                              style: TextStyle(
                                                color: const Color(0xFFE5E5E5),
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          S.of(context).sinceMNHumMax,
                                          style: TextStyle(
                                            color: const Color(0xFFE5E5E5),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.sinceMidnight.humidityMaxValue}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFFE5E5E5),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.sinceMidnight.humidityMaxTime}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFFE5E5E5),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        S.of(context).sinceMNHumMin,
                                        style: TextStyle(
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data.sinceMidnight.humidityMinValue}',
                                              style: TextStyle(
                                                color: const Color(0xFFE5E5E5),
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data.sinceMidnight.humidityMinTime}',
                                              style: TextStyle(
                                                color: const Color(0xFFE5E5E5),
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text(
                                          S.of(context).sinceMNWindMax,
                                          style: TextStyle(
                                            color: const Color(0xFFE5E5E5),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.sinceMidnight.windMaxValue}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFFE5E5E5),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${snapshot.data.sinceMidnight.windMaxTime}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFFE5E5E5),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        S.of(context).sinceMNTotalRain,
                                        style: TextStyle(
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${snapshot.data.sinceMidnight.rainSum}',
                                        style: TextStyle(
                                          color: const Color(0xFFE5E5E5),
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),

                  /// RADAR
                  imageWidget(radarUrl),
                ],
              ));
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

Widget imageWidget(url) {
  if (url != null) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(url),
      ),
    );
  } else {
    return null;
  }
}
