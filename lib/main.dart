import 'package:flutter/material.dart';
import 'screens/currentHome.dart';
import 'screens/summaryScreen.dart';
import 'localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(new MyApp());
}

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
    SummaryScreen(),
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
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF222836),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.timer),
              label: AppLocalizations.instance.text('BNVcurrent'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: AppLocalizations.instance.text('BNVsummary'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF00c2c2),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
