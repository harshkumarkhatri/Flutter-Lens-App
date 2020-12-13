import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/api/apiCall.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:flutter_ml_vision_del/views/pages/FindMeaningScreen/findMeaningScreen.dart';
import 'package:get/get.dart';

Widget findMeaning(
    AnimationController controller, queryRows, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
        top: Constants.padding8, bottom: Constants.padding8),
    child: Container(
      alignment: Alignment.centerRight,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: controller,
          curve: Interval(0.0, 1.0 - 2 / 3 / 2.0, curve: Curves.easeOut),
        ),
        child: GestureDetector(
          child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black45, blurRadius: 2, spreadRadius: 1)
              ], color: Colors.blue, borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(Constants.padding8),
                child: Text(
                  Constants.findMeaningString,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              )),
          onTap: () async {
            var resp = APICall.fetchAlbum(queryRows);
            resp.then((value) {
              final responseJSON = jsonDecode(value.body);
              var value1;
              try {
                value1 = responseJSON['results'][0]['lexicalEntries'][0]
                    ['entries'][0]['senses'][0]["definitions"][0];
              } on NoSuchMethodError catch (e) {
                value1 =
                    "No meaning could be found for the text you have extracted";
              }
              Get.to(
                FindMeaning(
                  value1 ==
                          "No meaning could be found for the text you have extracted"
                      ? value1.toString()
                      : "The meaning of the word extracted is \"${value1}\""
                          .toString(),
                ),
              );
            }).toString();
          },
        ),
      ),
    ),
  );
}
