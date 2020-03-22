import 'package:flutter/material.dart';
import 'fetchData.dart';
import 'json.dart';
import 'config.dart';
import 'generated/l10n.dart';
import 'images.dart';
import 'current.dart';
import 'extentedInfo.dart';

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

                  /// CURRENT
                  current(snapshot, context),

                  /// SINCE MIDNIGHT
                  extendedInfo(context, snapshot, 'sinceMidnight'),

                  /// YESTERDAY
                  extendedInfo(context, snapshot, 'yesterday'),

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
