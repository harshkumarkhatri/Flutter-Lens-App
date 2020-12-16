import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Constants {
  static List<String> listItems = [
    "Harsh",
    "Udhay",
    "Ashu",
    "Ajay",
    "Tommy",
    "Ranvijay",
    "Prince",
    "Tushar"
  ];

  static const String CAMERA_SOURCE = 'CAMERA_SOURCE';
  static const String GALLERY_SOURCE = 'GALLERY_SOURCE';

  static String assetImageLoc = "";

  static String recognizedText = "Loading ...";

  static String appTitle = "Flutter Lens";
  static String translatedTextString = "Translated Text";
  static String copyToClipString = "Copy to Clipboard";
  static String meaningString = "Meaning";
  static String extractedString = "Extracted Text";
  static String openDrawerString = "Open Drawer";
  static String optionString = "Options";
  static String copyString = "Copy";
  static String findMeaningString = "Find Meaning";
  static String openWithMapString = "OpenWith Map";
  static String searchOnWebString = "Search on Web";
  static String translateToHindiString = "Translate To Hindi";
  static String aboutTheAppString = "About the App";
  static String quickExitString = "Quick Exit";
  static String pullToRefString = "Pull down to refresh";
  static String chooseImgFromGalleryString = "Choose image from Gallery";
  static String chooseImgFromCameraString = "Choose image from Camera";

  static final SnackBar snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  static const double padding28 = 28.0;
  static const double padding18 = 18.0;
  static const double padding16 = 16.0;
  static const double padding15 = 15.0;
  static const double padding10 = 10.0;
  static const double padding8 = 8.0;
  static const double padding4 = 4.0;
  static const double elevation8 = 8.0;
  static const double height140 = 140.0;
  static const double height60 = 60.0;
  static const double height55 = 55.0;
  static const double height40 = 40.0;
  static const double height30 = 30.0;
  static const double height20 = 20.0;
  static const double height10 = 10.0;
  static const double width250 = 250.0;
  static const double width140 = 140.0;

  static Future<void> openMap(location) async {
    print("Location is $location");
    String googleUrl = "https://www.google.com/maps/place/${location}";
    // 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> searchOnWeb(query) async {
    print("Query is $query");
    String googleUrl = "https://www.google.com/search?q=${query}";
    // 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
