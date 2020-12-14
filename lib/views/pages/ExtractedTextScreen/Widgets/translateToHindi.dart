import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:flutter_ml_vision_del/views/pages/TranslatedTextScreen/translatedTextScreen.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

Widget translateToHindi(AnimationController controller, BuildContext context,
    String extractedText) {
  GoogleTranslator translator = GoogleTranslator();

  void trans() {
    translator.translate(extractedText, to: "hi").then((value) {
      Get.to(
        TranslatedText(
          value.toString(),
        ),
      );
    });
  }

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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45, blurRadius: 2, spreadRadius: 1)
                ],
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  4,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Constants.padding8),
                child: Text(
                  Constants.translateToHindiString,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              )),
          onTap: () async {
            trans();
          },
        ),
      ),
    ),
  );
}
