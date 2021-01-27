import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  final websiteUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    websiteUrlController.addListener(_updateUrl);
  }

  @override
  void dispose() {
    websiteUrlController.dispose();
    super.dispose();
  }

  void _updateUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('weatherUrl', websiteUrlController.text);
    print(prefs.getString('weatherUrl'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      controller: websiteUrlController,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: 'Enter a search term'),
    ));
  }
}
