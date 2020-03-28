import '../api/fetchData.dart';
import '../api/json.dart';
import 'package:flutter/material.dart';
import '../widget/extentedInfo.dart';
import '../localizations.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({Key key}) : super(key: key);
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
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                children: [
                  /// Week
                  extendedInfo(context, snapshot.data.week,
                      AppLocalizations.instance.text('weekTitle')),

                  /// Month
                  extendedInfo(context, snapshot.data.month,
                      AppLocalizations.instance.text('monthTitle')),
                  
                  /// Year
                  extendedInfo(context, snapshot.data.year,
                      AppLocalizations.instance.text('yearTitle')),
                ],
              ));
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
