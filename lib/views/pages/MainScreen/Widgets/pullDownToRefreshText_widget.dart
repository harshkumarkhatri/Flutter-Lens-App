import 'package:flutter/material.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';

Widget pullDownToRefresh(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      top: Constants.padding4,
      bottom: Constants.padding4,
    ),
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      color: Colors.pink,
      child: Text(Constants.pullToRefString),
    ),
  );
}
