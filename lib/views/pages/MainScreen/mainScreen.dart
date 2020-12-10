import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ml_vision_del/repositories/databaseHelper.dart';
import 'package:flutter_ml_vision_del/utils/constants.dart';
import 'package:flutter_ml_vision_del/views/pages/AboutTheApp/aboutTheAppScreen.dart';
import 'package:flutter_ml_vision_del/views/pages/ExtractedTextScreen/extractedTextScreen.dart';
import 'package:flutter_ml_vision_del/views/pages/MainScreen/Widgets/chooseImageFromCamerawidget.dart';
import 'package:flutter_ml_vision_del/views/pages/MainScreen/Widgets/chooseImageFromGallery_widget.dart';
import 'package:flutter_ml_vision_del/views/pages/MainScreen/Widgets/pullDownToRefreshText_widget.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> _queryRows;

  List<String> items;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    // if failed,use refreshFailed()
    _queryRows = await DatabaseHelper.instance.queryAll("myTable");
    items = [];
    for (var i = 0; i < _queryRows.length; i++) {
      setState(() {
        items.add(_queryRows[i]["items"]);
        items;
      });
    }
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _queryRows = await DatabaseHelper.instance.queryAll("myTable");
    items = [];
    for (var i = 0; i < _queryRows.length; i++) {
      items.add(_queryRows[i]["items"]);
      setState(() {
        items;
      });
    }
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    items = [];
    init();
    super.initState();
  }

  void init() async {
    _queryRows = await DatabaseHelper.instance.queryAll("myTable");
    for (var i = 0; i < _queryRows.length; i++) {
      items.add(_queryRows[i]["items"]);
      setState(() {
        items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {Constants.aboutTheAppString, Constants.quickExitString}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          Constants.appTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.white10.withOpacity(0.6),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
              left: Constants.padding15, right: Constants.padding15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              pullDownToRefresh(context),
              Expanded(
                child: Container(
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: true,
                    header: WaterDropHeader(),
                    footer: CustomFooter(
                      builder: (BuildContext context, LoadStatus mode) {
                        Widget body;
                        if (mode == LoadStatus.idle) {
                          body = Text("pull up load");
                        } else if (mode == LoadStatus.loading) {
                          body = CupertinoActivityIndicator();
                        } else if (mode == LoadStatus.failed) {
                          body = Text("Load Failed!Click retry!");
                        } else if (mode == LoadStatus.canLoading) {
                          body = Text("release to load more");
                        } else {
                          body = Text("No more Data");
                        }
                        return Container(
                          height: Constants.height55,
                          child: Center(child: body),
                        );
                      },
                    ),
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    child: ListView.builder(
                      itemBuilder: (c, i) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: Constants.padding10,
                          left: Constants.padding8,
                          right: Constants.padding8,
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "* ${items[i]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      letterSpacing: 0.6),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      deleteItem(
                                        i,
                                        _queryRows[i]["_id"],
                                      );
                                    },
                                  );
                                },
                                child: Icon(
                                  Icons.delete,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      itemCount: items.length ?? 0,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onPickImageSelected(Constants.CAMERA_SOURCE);
                },
                child: chooseImageFromCamera(),
              ),
              GestureDetector(
                onTap: () {
                  onPickImageSelected(Constants.GALLERY_SOURCE);
                },
                child: chooseImageFromGallery(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPickImageSelected(
    String source,
  ) async {
    var imageSource;
    if (source == Constants.CAMERA_SOURCE) {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }

    try {
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file == null) {
        Get.snackbar(
          "No image Selected",
          "Select an image to move forward",
          isDismissible: true,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
        );
        throw Exception('File is not available');
      }
      Get.to(
        ExtractedTextScreen(file),
      );
    } catch (e) {
      Get.snackbar(
        "No image Selected",
        "Select an image to move forward",
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
    }
  }

  // Handleing the switching between the items of 3 dots on top right
  void handleClick(String value) {
    switch (value) {
      case 'Quick Exit':
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        break;
      case 'About the App':
        // TODO: add the about the app screen
        Get.to(AboutTheApp());
        break;
    }
  }

  // Deleting the item from the database
  deleteItem(indexOfItem, _id) async {
    _queryRows = await DatabaseHelper.instance.queryAll("myTable");
    await DatabaseHelper.instance.delete(_id);
    _queryRows = await DatabaseHelper.instance.queryAll("myTable");
    items.removeAt(indexOfItem);
    setState(() {
      _queryRows;
    });
  }
}
