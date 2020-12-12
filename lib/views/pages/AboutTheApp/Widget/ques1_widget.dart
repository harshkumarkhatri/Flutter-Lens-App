import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

Widget question1() {
  return Container(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.all(Constants.padding8),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("What is Flutter Lens?", style: TextStyle(fontSize: 18)),
          Icon(Icons.arrow_circle_down)
        ],
      ),
    ),
  );
}
