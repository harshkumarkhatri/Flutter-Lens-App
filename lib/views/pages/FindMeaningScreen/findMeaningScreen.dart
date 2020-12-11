import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

class FindMeaning extends StatefulWidget {
  String extractedText;
  FindMeaning(this.extractedText);
  @override
  _FindMeaningState createState() => _FindMeaningState();
}

class _FindMeaningState extends State<FindMeaning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.meaningString,
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
            ],
          ),
        ),
      ),
    );
  }
}
