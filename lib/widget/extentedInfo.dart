import 'package:flutter/widgets.dart';
import '../localizations.dart';

Widget extendedInfo(context, jsonData, title) {
  return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          color: const Color.fromRGBO(48, 51, 59, 1.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    child: Text(
                      title,
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
                          AppLocalizations.instance.text('sinceMNTempMax'),
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
                                jsonData.tempMaxValue.replaceAll('Â°', '°'),
                                style: TextStyle(
                                  color: const Color(0xFFE5E5E5),
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                jsonData.tempMaxTime,
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
                        AppLocalizations.instance.text('sinceMNTempMin'),
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
                              jsonData.tempMinValue.replaceAll('Â°', '°'),
                              style: TextStyle(
                                color: const Color(0xFFE5E5E5),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              jsonData.tempMinTime,
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
                          AppLocalizations.instance.text('sinceMNHumMax'),
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
                                jsonData.humidityMaxValue,
                                style: TextStyle(
                                  color: const Color(0xFFE5E5E5),
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                jsonData.humidityMaxTime,
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
                        AppLocalizations.instance.text('sinceMNHumMin'),
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
                              jsonData.humidityMinValue,
                              style: TextStyle(
                                color: const Color(0xFFE5E5E5),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              jsonData.humidityMinTime,
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
                          AppLocalizations.instance.text('sinceMNWindMax'),
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
                                jsonData.windMaxValue,
                                style: TextStyle(
                                  color: const Color(0xFFE5E5E5),
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                jsonData.windMaxTime,
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
                        AppLocalizations.instance.text('sinceMNTotalRain'),
                        style: TextStyle(
                          color: const Color(0xFFE5E5E5),
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        jsonData.rainSum,
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
