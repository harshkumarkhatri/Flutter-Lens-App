import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:get/get.dart';

Widget copyToClipboard(AnimationController controller, String textToBeCopied) {
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
                  Constants.copyString,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )),
          onTap: () async {
            Clipboard.setData(ClipboardData(text: textToBeCopied));
            controller.reverse();

            Get.snackbar(
              "Copied",
              "Text copied to clipboard!",
              isDismissible: true,
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 3),
            );
          },
        ),
      ),
    ),
  );
}
