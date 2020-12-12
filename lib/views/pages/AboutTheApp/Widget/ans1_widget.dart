import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

Widget answer1() {
  return Padding(
    padding: const EdgeInsets.all(Constants.padding8),
    child: new Text(
        "It is an app through which you can extract text from images.",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.6,
            height: 1.1)),
  );
}
