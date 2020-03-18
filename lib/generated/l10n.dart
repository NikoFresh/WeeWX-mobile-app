// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get currentTitle {
    return Intl.message(
      'Current weather',
      name: 'currentTitle',
      desc: '',
      args: [],
    );
  }

  String get currentTemp {
    return Intl.message(
      'Temperature: ',
      name: 'currentTemp',
      desc: '',
      args: [],
    );
  }

  String get currentHumidity {
    return Intl.message(
      'Humidity: ',
      name: 'currentHumidity',
      desc: '',
      args: [],
    );
  }

  String get currentWind {
    return Intl.message(
      'Wind: ',
      name: 'currentWind',
      desc: '',
      args: [],
    );
  }

  String get currentRainRate {
    return Intl.message(
      'Rain rate: ',
      name: 'currentRainRate',
      desc: '',
      args: [],
    );
  }

  String get currentBarometer {
    return Intl.message(
      'Barometer: ',
      name: 'currentBarometer',
      desc: '',
      args: [],
    );
  }

  String get currentWindChill {
    return Intl.message(
      'Wind chill: ',
      name: 'currentWindChill',
      desc: '',
      args: [],
    );
  }

  String get sinceMNTitle {
    return Intl.message(
      'Since midnight',
      name: 'sinceMNTitle',
      desc: '',
      args: [],
    );
  }

  String get sinceMNTempMax {
    return Intl.message(
      'High temperature: ',
      name: 'sinceMNTempMax',
      desc: '',
      args: [],
    );
  }

  String get sinceMNTempMin {
    return Intl.message(
      'Low temperature: ',
      name: 'sinceMNTempMin',
      desc: '',
      args: [],
    );
  }

  String get sinceMNHumMax {
    return Intl.message(
      'High humidity: ',
      name: 'sinceMNHumMax',
      desc: '',
      args: [],
    );
  }

  String get sinceMNHumMin {
    return Intl.message(
      'Low humidity: ',
      name: 'sinceMNHumMin',
      desc: '',
      args: [],
    );
  }

  String get sinceMNWindMax {
    return Intl.message(
      'High wind: ',
      name: 'sinceMNWindMax',
      desc: '',
      args: [],
    );
  }

  String get sinceMNTotalRain {
    return Intl.message(
      'Total rain: ',
      name: 'sinceMNTotalRain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'it'), Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}