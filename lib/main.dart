import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:get/get.dart';
import 'views/pages/MainScreen/mainScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: Constants.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen());
  }
}
