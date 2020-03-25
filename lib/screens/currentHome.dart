import '../api/fetchData.dart';
import '../api/json.dart';
import 'package:flutter/material.dart';
import '../widget/images.dart';
import '../widget/current.dart';
import '../widget/extentedInfo.dart';
import '../config.dart';

class CurrentHome extends StatelessWidget {
  CurrentHome({Key key}) : super(key: key);
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
