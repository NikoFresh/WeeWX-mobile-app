import 'package:flutter/widgets.dart';
import '../generated/l10n.dart';

Widget extendedInfo(context, snapshot, time) {
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
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      time == 'sinceMidnight'
                          ? S.of(context).sinceMNTitle
                          : S.of(context).yesterdayTitle,
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
                  padding: const EdgeInsets.only(top: 15.0, bottom: 8.0),
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
                                time == 'sinceMidnight'
                                    ?  snapshot.data.sinceMidnight.tempMaxValue.replaceFirst('&#176;', '°')
                                    : snapshot.data.yesterday.tempMaxValue.replaceFirst('&#176;', '°'),
                                style: TextStyle(
                                  color: const Color(0xFFE5E5E5),
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                time == 'sinceMidnight'
                                    ? '${snapshot.data.sinceMidnight.tempMaxTime}'
                                    : '${snapshot.data.yesterday.tempMaxTime}',
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
                              time == 'sinceMidnight'
                                  ? snapshot.data.sinceMidnight.tempMinValue.replaceFirst('&#176;', '°')
                                  : snapshot.data.yesterday.tempMinValue.replaceFirst('&#176;', '°'),
                              style: TextStyle(
                                color: const Color(0xFFE5E5E5),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              time == 'sinceMidnight'
                                  ? '${snapshot.data.sinceMidnight.tempMinTime}'
                                  : '${snapshot.data.yesterday.tempMinTime}',
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
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                time == 'sinceMidnight'
                                    ? '${snapshot.data.sinceMidnight.humidityMaxValue}'
                                    : '${snapshot.data.yesterday.humidityMaxValue}',
                                style: TextStyle(
                                  color: const Color(0xFFE5E5E5),
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                time == 'sinceMidnight'
                                    ? '${snapshot.data.sinceMidnight.humidityMaxTime}'
                                    : '${snapshot.data.yesterday.humidityMaxTime}',
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
                              time == 'sinceMidnight'
                                  ? '${snapshot.data.sinceMidnight.humidityMinValue}'
                                  : '${snapshot.data.yesterday.humidityMinValue}',
                              style: TextStyle(
                                color: const Color(0xFFE5E5E5),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              time == 'sinceMidnight'
                                  ? '${snapshot.data.sinceMidnight.humidityMinTime}'
                                  : '${snapshot.data.yesterday.humidityMinTime}',
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
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                                time == 'sinceMidnight'
                                    ? '${snapshot.data.sinceMidnight.windMaxValue}'
                                    : '${snapshot.data.yesterday.windMaxValue}',
                                style: TextStyle(
                                  color: const Color(0xFFE5E5E5),
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                time == 'sinceMidnight'
                                    ? '${snapshot.data.sinceMidnight.windMaxTime}'
                                    : '${snapshot.data.yesterday.windMaxTime}',
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
                        time == 'sinceMidnight'
                            ? '${snapshot.data.sinceMidnight.rainSum}'
                            : '${snapshot.data.yesterday.rainSum}',
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
      ));
}
