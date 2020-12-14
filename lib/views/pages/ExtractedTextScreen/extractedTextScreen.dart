import 'dart:async';
import 'dart:io';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/repositories/databaseHelper.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:flutter_ml_vision_del/views/pages/ExtractedTextScreen/Widgets/circularProgInd_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/ExtractedTextScreen/Widgets/copyToClipboard_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/ExtractedTextScreen/Widgets/findMeaning_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/ExtractedTextScreen/Widgets/openWithMap_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/ExtractedTextScreen/Widgets/searchOnWeb_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/ExtractedTextScreen/Widgets/translateToHindi.dart';
import 'package:get/get.dart';

class ExtractedTextScreen extends StatefulWidget {
  final File imagePath;

  ExtractedTextScreen(this.imagePath);
  @override
  _ExtractedTextScreenState createState() =>
      _ExtractedTextScreenState(imagePath);
}

class _ExtractedTextScreenState extends State<ExtractedTextScreen>
    with TickerProviderStateMixin {
  _ExtractedTextScreenState(this.path);

  final File path;

  Size _imageSize;

  AnimationController controller;

  void _initializeVision() async {
    final File imageFile = path;

    if (imageFile != null) {
      await _getImageSize(imageFile);
    }

    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);

    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();

    try {
      final VisionText visionText =
          await textRecognizer.processImage(visionImage);
      String mailAddress = "";

      for (TextBlock block in visionText.blocks) {
        mailAddress += block.text + '\n';
      }
      int i = await DatabaseHelper.instance.insert("myTable", {
        DatabaseHelper.columnName: "copiedText",
        DatabaseHelper.columnName2:
            "${mailAddress.replaceAll("\n", " ").replaceAll(" ", " ")}"
      });

      if (this.mounted) {
        setState(() {
          Constants.recognizedText = mailAddress;
        });
      }
    } catch (e) {
      Get.snackbar(
        "Image dimensions are small",
        "Hit back and choose another image",
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  Future<void> _getImageSize(File imageFile) async {
    final Completer<Size> completer = Completer<Size>();

    try {
      // Fetching image from path
      final Image image = Image.file(imageFile);
      // Retrieving its size
      image.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo info, bool _) {
          completer.complete(Size(
            info.image.width.toDouble(),
            info.image.height.toDouble(),
          ));
        }),
      );

      final Size imageSize = await completer.future;
      setState(() {
        _imageSize = imageSize;
      });
    } catch (e) {
      Get.snackbar(
        "Unappropriate image Size",
        "Please choose another image",
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  void initState() {
    _initializeVision();
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    init();
  }

  List<Map<String, dynamic>> queryRows;
  void init() async {
    queryRows = await DatabaseHelper.instance.queryAll("myTable");
    setState(() {
      queryRows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Image Details"),
      ),
      body: _imageSize != null
          ? Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    width: double.maxFinite,
                    color: Colors.black,
                    child: AspectRatio(
                      aspectRatio: _imageSize.aspectRatio,
                      child: Image.file(
                        path,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    elevation: Constants.elevation8,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(Constants.padding16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: Constants.padding8),
                            child: Text(
                              Constants.extractedString,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: Constants.height60,
                            child: SingleChildScrollView(
                              child: Text(
                                Constants.recognizedText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : circularProgInd(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          translateToHindi(controller, context, Constants.recognizedText),
          searchOnWeb(
              controller,
              Constants.recognizedText
                  .replaceAll("\n", " ")
                  .replaceAll(" ", " ")),
          openWithMap(
              controller,
              Constants.recognizedText
                  .replaceAll("\n", "+")
                  .replaceAll(" ", "+")),
          findMeaning(
              controller,
              Constants.recognizedText
                  .replaceAll("\n", " ")
                  .replaceAll(" ", " "),
              context),
          copyToClipboard(
            controller,
            Constants.recognizedText,
          ),
          FloatingActionButton.extended(
            heroTag: null,
            tooltip: Constants.openDrawerString,
            icon: AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform: Matrix4.rotationZ(controller.value * 01 * 3.1415),
                  alignment: FractionalOffset.center,
                  child: Icon(Icons.keyboard_arrow_down),
                );
              },
            ),
            label: Container(child: Text(Constants.optionString)),
            onPressed: () {
              if (controller.isDismissed) {
                controller.forward();
              } else {
                controller.reverse();
              }
            },
          ),
        ],
      ),
    );
  }
}
