import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:geocoder/geocoder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

Widget openWithMap(AnimationController controller, String location) {
  void cordFinder(query) async {
    try {
      var addresses = await Geocoder.local.findAddressesFromQuery(query);

      final url =
          'https://www.google.com/maps/search/?api=1&query=${addresses.first.coordinates.latitude},${addresses.first.coordinates.longitude}';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      Get.snackbar(
        "Location not found",
        "Sorry, the location could not be found",
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
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
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(color: Colors.black45, blurRadius: 2, spreadRadius: 1)
              ], color: Colors.blue, borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(Constants.padding8),
                child: Text(
                  Constants.openWithMapString,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              )),
          onTap: () async {
            cordFinder(location);
          },
        ),
      ),
    ),
  );
}
