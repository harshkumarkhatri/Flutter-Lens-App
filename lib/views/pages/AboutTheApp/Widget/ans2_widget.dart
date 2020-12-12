import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

Widget answer2() {
  return Padding(
    padding: const EdgeInsets.all(Constants.padding8),
    child: new Text(
        "You can copy the extracted text, convert it to hindi, find the meaning of the extracted text, open the text in google map or seach the extracted text on google search.",
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.6,
            height: 1.1)),
  );
}
