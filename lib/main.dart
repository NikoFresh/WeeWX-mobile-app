import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'screens/currentHome.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedTab = 0;
  final _pageOptions = [
    CurrentHome(),
    Text('I\'m useless'),
    Text('I\'m useless too'),
    //Text('I\'m useless'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Weewx weather app',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFF131825),
          accentColor: const Color(0xFF2D3446),
          textTheme: TextTheme()),
      home: Scaffold(
        body: SafeArea(child: _pageOptions[_selectedTab]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (int index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              title: Text('Current'),
              backgroundColor: Theme.of(context).primaryColor,
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
        ),
      ),
    );
  }
}
