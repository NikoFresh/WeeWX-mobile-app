import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 40, 1.0),
        body: SafeArea(
          child: ListView(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
              children: [
                /// Title
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Settings ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00c2c2),
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showAboutDialog(
                        context: context, applicationVersion: '1.3');
                  },
                  child: Text('Info'),
                )
              ]),
        ));
  }
}
