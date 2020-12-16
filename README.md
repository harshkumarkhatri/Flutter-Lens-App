# Flutter Lens

[![forthebadge](https://forthebadge.com/images/badges/built-by-developers.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/made-with-reason.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/open-source.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/you-didnt-ask-for-this.svg)](https://forthebadge.com)


## Introduction 📌

Flutter lens is an app through which you can extract out text from the images and then perform various different operations with the extracted text.

Through this app I have tried merging features from different apps and have bough them to one place with such an ease and a beginner friendly UI.

## Technology Stack 🏁

* [Flutter](https://flutter.dev/)
* [Firebase ML Vision](https://pub.dev/packages/firebase_ml_vision)
* [Image Picker](https://pub.dev/packages/image_picker)
* [Path Provider](https://pub.dev/packages/path_provider)
* [Intl](https://pub.dev/packages/intl)
* [URL Launcher](https://pub.dev/packages/url_launcher)
* [SQFLite](https://pub.dev/packages/sqflite)
* [Pull to Refresh](https://pub.dev/packages/pull_to_refresh)
* [Translator](https://pub.dev/packages/translator)
* [HTTP](https://pub.dev/packages/http)
* [Geocoder](https://pub.dev/packages/geocoder)
* [get](https://pub.dev/packages/get)

## Why this Project? 🏃‍♂️

This project is to help people wo are unable to understand text in English or are lazy to type things.

Through this app you can directly click an snap or choose an image from your local storage and get the text out of it. With the extracted text you can perform thing like:
* Copying the text to clipboard
* Searching the text on google search
* Opening the extracted text in google maps
* Translating the text to Hindi
* Finding the meaning of the extracted text

The availability of various different features at one place and the beginner friendly UI is something which a user likes about this app.

For this project, I have worked on various domains like:
* UI/UX Development with Flutter
* Interacting with google maps
* Interacting with google search
* Interacting with [oxford dictionary API](https://developer.oxforddictionaries.com/).
* Translating the text using translator package
* Copying the text to clipboard

## 👀 Build Instructions 

- Clone the Repository: `git clone https://github.com/harshkumarkhatri/Flutter-Lens-App`
- `cd` into the Repository: `cd Flutter-Lens-App`
- You need to visit [Oxford dictionary API](https://developer.oxforddictionaries.com/) page and make an account and then generate an api_id & api_key. Replace these in lib\api\apiCredentials.dart. You can either make a new class as I did or directly add your api_id & api_key there.
- If you want to have a look at the project in web then you can follow the steps given below.
  - Enable beta channel and enable web support:
```
$ flutter channel beta
$ flutter upgrade
$ flutter config --enable-web
```
- Check for the Devices configured for Flutter Web: `flutter devices`
- Run the App in Release Mode: `flutter run`
- Generate a Build: `flutter build apk --split-per-abi`

## Contributors ✨

- [Harsh Kumar Khatri](https://github.com/harshkumarkhatri)