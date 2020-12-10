import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

Widget chooseImageFromGallery() {
  return Padding(
    padding: const EdgeInsets.only(
        top: Constants.padding8, bottom: Constants.padding18),
    child: Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      child: Center(
        child: Text(
          Constants.chooseImgFromGalleryString,
          style: TextStyle(color: Colors.black),
        ),
      ),
    ),
  );
}
