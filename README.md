# WeeWX weather app

WeeWX Weather App is a mobile application for [WeeWX](http://weewx.com) built with [Flutter](https://flutter.dev/)

## Installation
### WeeWX installation
Copy the file weewx/app.json.tmpl to your WeeWX server in the skin you're currently using, then edit the skin.conf file:

```conf
[CheetahGenerator]
   ...
   [[ToDate]]
   ...
      [[[mobileapp]]]
            template = app.json.tmpl
```
### App installation
#### Note: these instruction are for Android. To buld the app for iOS, follow [this](https://flutter.dev/docs/deployment/ios). 
##### Install Flutter in your computer if you don't have it already: [Install - Flutter](https://flutter.dev/docs/get-started/install);

##### Clone the repository.

##### Run 'flutter packages get'

##### Add your links in the app:
In the /lib/config.dart:
```dart
final weatherDataUrl = ; // Required
final radarUrl = ; // Optional
final webcamUrl = ; // Optional
```


##### Optional: Modify the name of the app:
In pubspec.yaml edit the app name and the icon:
```yaml
name: weewx_mobile_app

flutter_icons:
  image_path: 'assets/icon.png'
```
In /android/app/src/main/AndroidManifest.xml update the package name and the app name:
```xml
<application
        ...
        android:label="MeteoCentroCadore"
        ...>
```
In /android/app/build.gradle edit the application id:
```grandle
defaultConfig {
        applicationId "com.nikofresh.weewx"
        ...
    }
```

##### Run the build:
```bash
flutter build apk
```
You'll have the apk file in weewx-mobile-app/build/app/outputs/apk/release/app-relase.apk

## Internationalization
Install [this](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl) plugin for VS Code. Run the command "Flutter Intl: Add locale" and edit the file /l10n/intl_locale.arb.
##### Note that the app is already translated in English and Italian

## License
[MIT](https://github.com/NikoFresh/WeeWX-mobile-app/blob/master/license)