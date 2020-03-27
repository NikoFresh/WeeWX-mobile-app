import 'package:flutter/material.dart';
import 'screens/currentHome.dart';
import 'localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  runApp(new MyApp());
}


/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'WeeWX weather app';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('it', ''),
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      title: _title,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF131825),
          accentColor: const Color(0xFF2D3446),
          textTheme: TextTheme()),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    CurrentHome(),
    Text(
      'I\'m useless',
      style: optionStyle,
    ),
    Text(
      'I\'m useless too',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Current'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Summary'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}