import '../api/fetchData.dart';
import '../api/json.dart';
import 'package:flutter/material.dart';
import '../widget/images.dart';
import '../widget/current.dart';
import '../widget/extentedInfo.dart';
import '../config.dart';
import '../localizations.dart';

class CurrentHome extends StatelessWidget {
  CurrentHome({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 40, 1.0),
      body: FutureBuilder<WeatherData>(
          future: getWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }

              return SafeArea(
                  child: ListView(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                children: [
                  /// Title
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '${snapshot.data.location} ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00c2c2),
                              fontSize: 25.0,
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
                  ),

                  /// WEBCAM
                  imageWidget(webcamUrl),

                  /// CURRENT
                  current(snapshot, context),

                  /// SINCE MIDNIGHT
                  extendedInfo(context, snapshot.data.sinceMidnight,
                      AppLocalizations.instance.text('sinceMNTitle')),

                  /// YESTERDAY
                  extendedInfo(context, snapshot.data.yesterday,
                      AppLocalizations.instance.text('yesterdayTitle')),

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
