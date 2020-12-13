import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:flutter_ml_vision_del/views/pages/AboutTheApp/Widget/ans1_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/AboutTheApp/Widget/ans2_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/AboutTheApp/Widget/ques1_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/AboutTheApp/Widget/ques2_widget.dart';

class AboutTheApp extends StatefulWidget {
  @override
  _AboutTheAppState createState() => _AboutTheAppState();
}

class _AboutTheAppState extends State<AboutTheApp> {
  double _animatedHeight = 100.0;
  bool initial1 = false;
  bool initial2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.aboutTheAppString),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: Constants.padding28, right: Constants.padding28),
          child: Column(
            children: [
              SizedBox(height: Constants.height40),
              Center(
                child: Container(
                  height: Constants.height140,
                  width: Constants.width140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(
                        Constants.assetImageLoc,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: Constants.padding15,
                  left: Constants.padding15,
                  right: Constants.padding15,
                ),
                child: Text(
                  "An app which can extract text from images and lwt you perform vious things with the extracted text.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
                  textAlign: TextAlign.center,
                ),
              ),
              Card(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new GestureDetector(
                        onTap: () => setState(() {
                              _animatedHeight == 0.0
                                  ? _animatedHeight = 100.0
                                  : _animatedHeight = 00.0;
                              initial1 == false
                                  ? initial1 = true
                                  : initial1 = false;
                            }),
                        child: question1()),
                    initial1 == true
                        ? new AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            child: answer1(),
                            color: Colors.tealAccent,
                          )
                        : Container(height: 0, width: 0)
                  ],
                ),
              ),
              SizedBox(height: Constants.height10),
              Card(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () => setState(() {
                        _animatedHeight == 0.0
                            ? _animatedHeight = 100.0
                            : _animatedHeight = 00.0;
                        initial2 == false ? initial2 = true : initial2 = false;
                      }),
                      child: new Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                question2(),
                                Icon(Icons.arrow_circle_down)
                              ],
                            )),
                      ),
                    ),
                    initial2 == true
                        ? new AnimatedContainer(
                            duration: const Duration(milliseconds: 120),
                            child: answer2(),
                            color: Colors.tealAccent,
                          )
                        : Container()
                  ],
                ),
              ),
              SizedBox(height: Constants.height30),
              Center(child: Text("Version:1.0.1")),
              SizedBox(height: Constants.height20),
            ],
          ),
        ),
      ),
    );
  }
}
