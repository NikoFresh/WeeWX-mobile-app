import 'package:flutter/widgets.dart';
import '../localizations.dart';

Widget current(snapshot, context) {
  /// Current weather
  return Container(
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
                        AppLocalizations.instance.text('currentTitle'),
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
                  padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          AppLocalizations.instance.text('currentTemp') +
                              snapshot.data.current.outTemp,
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
                        AppLocalizations.instance.text('currentHumidity') +
                            snapshot.data.current.humidity,
                        style: TextStyle(
                          color: const Color(0xFFE5E5E5),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          AppLocalizations.instance.text('currentWind') +
                              snapshot.data.current.windSpeed,
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
                        AppLocalizations.instance.text('currentRainRate') +
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
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          AppLocalizations.instance.text('currentBarometer') +
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
                        AppLocalizations.instance.text('currentWindChill') +
                            snapshot.data.current.windchill,
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
  );
}
