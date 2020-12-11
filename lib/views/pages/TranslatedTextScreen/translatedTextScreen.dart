import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

import 'Widgets/copyToClipboard_widget.dart';

class TranslatedText extends StatefulWidget {
  String extractedText;
  TranslatedText(this.extractedText);
  @override
  _TranslatedTextState createState() => _TranslatedTextState();
}

class _TranslatedTextState extends State<TranslatedText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.translatedTextString,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: Constants.padding8,
          left: Constants.padding15,
          right: Constants.padding15,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Text(
                  widget.extractedText,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              copyToClipBoard_transText(widget.extractedText),
            ],
          ),
        ),
      ),
    );
  }
}
