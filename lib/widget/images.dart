import 'package:flutter/material.dart';

Widget imageWidget(url) {
  if (url != null) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(url),
      ),
    );
  } else {
    return null;
  }
}
