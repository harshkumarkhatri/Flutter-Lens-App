import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

Widget copyToClipBoard_transText(textToBeCopied) {
  return GestureDetector(
    onTap: () {
      Clipboard.setData(ClipboardData(text: textToBeCopied));
    },
    child: Padding(
      padding: const EdgeInsets.only(
        top: Constants.padding15,
        bottom: Constants.padding15,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(
            16,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            Constants.copyToClipString,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ),
  );
}
