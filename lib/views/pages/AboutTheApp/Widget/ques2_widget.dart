import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

Widget question2() {
  return Container(
    width: Constants.width250,
    child: Text("What all things can i do in this app?",
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18)),
  );
}
