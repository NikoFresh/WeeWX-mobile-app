import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'fetchData.dart';
import 'json.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(
          title: 'Meteo bello app',
        ));
  }
}

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f2942),
      body: FutureBuilder<WeatherData>(
          future: getWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text("Error");
              }

              return SafeArea(
                  child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      /// TITOLO
                      Text(
                        'In questo momento ci sono ${snapshot.data.current.outTemp} °C a ${snapshot.data.location}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFE5E5E5),
                          fontSize: 20.0,
                        ),
                      ),

                      /// WEBCAM
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.network(
                              'https://webcamflutterapi--nikofresh.repl.co/webcam'),
                        ),
                      ),

                      /// CONDIZIONI ATTUALI
                      Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            color: const Color(0xFF3A445D),
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            'Condizioni attuali:',
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
                                          top: 8.0, bottom: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              'Umidità: ${snapshot.data.current.humidity}',
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
                                            'Vento: ${snapshot.data.current.windSpeed}',
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
                                              'Intensità pioggia: ${snapshot.data.current.rainRate}',
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
                                            'Pressione: ${snapshot.data.current.barometer}',
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

                      /// DALLA MEZZANOTTE
                      Container(
                          color: Colors.transparent,
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Container(
                              color: const Color(0xFF3A445D),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        child: Text(
                                          "Dalla mezzanotte:",
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
                                          top: 8.0, bottom: 8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Text(
                                              'Temperatura:',
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
                                                      color: const Color(
                                                          0xFFE5E5E5),
                                                      fontSize: 16.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    '${snapshot.data.sinceMidnight.tempMaxValue} °C',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFFE5E5E5),
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
                                            'Umidità:',
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
                                                    color:
                                                        const Color(0xFFE5E5E5),
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                              ),
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
                                              'Vento massimo:',
                                              style: TextStyle(
                                                color: const Color(0xFFE5E5E5),
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data.sinceMidnight.windMaxValue} - ${snapshot.data.sinceMidnight.windMaxTime}',
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
                                            'Pioggia totale:',
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
                          ))
                    ],
                  ),
                ),
              ));
            } else
              return Center(child: CircularProgressIndicator());
          }),

      /// BOTTOM NAVBAR
      bottomNavigationBar: FutureBuilder<WeatherData>(
          future: getWeatherData(),
          builder: (context, snapshot) {
            return Container(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Ultimo aggiornamento: ${snapshot.data.time}',
                    style: TextStyle(
                      color: const Color(0xFFE5E5E5),
                      fontSize: 13.0,
                    ),
                  ),
                  Icon(MaterialCommunityIcons.menu_left_outline)
                ],
              ),
            ));
          }),
    );
  }
}
