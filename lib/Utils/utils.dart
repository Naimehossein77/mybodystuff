import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

String? validateText(String value) {
  if (value.isEmpty) {
    return "Required field";
  }
  return null;
}

String? validatePassword(String value) {
  if (!(value.length > 5)) {
    return "Password should contain 6 characters";
  }
  return null;
}

extension TitleCase on String {
  String toTitleCase() {
    if (this == '') {
      return '';
    }

    final List<String> words = this.trim().split(' ');
    final List<String> capitalizedWords = words
        .map((word) => '${word[0].toUpperCase()}${word.substring(1)}')
        .toList();

    return capitalizedWords.join(' ');
  }
}

Future<Map<String, dynamic>> loadJsonFromAsset(String path) async {
  String jsonString = await rootBundle.loadString(path);
  return json.decode(jsonString);
}

Future<String> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  // if (Platform.isIOS) {
  //   // import 'dart:io'
  //   var iosDeviceInfo = await deviceInfo.iosInfo;
  //   return iosDeviceInfo.identifierForVendor ?? ''; // unique ID on iOS
  // } else if (Platform.isAndroid) {
  //   var androidDeviceInfo = await deviceInfo.androidInfo;
  //   return androidDeviceInfo.id; // unique ID on Android
  // } else 
  if
  (kIsWeb){
    WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;

    return  webInfo.vendor! + webInfo.userAgent! + webInfo.hardwareConcurrency.toString();
 
  }
  return '';
}
