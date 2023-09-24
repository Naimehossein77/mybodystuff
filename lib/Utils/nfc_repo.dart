import 'dart:io';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NFCRepo {
  //make it singleTone class
  static final NFCRepo _singleton = NFCRepo._internal();
  factory NFCRepo() {
    return _singleton;
  }
  NFCRepo._internal();
  //code starts from here

  Future<bool> isNfcSupported() async {
    //you don't really have to check the platform here, you can use
    // only one plugin to check if NFC is available, i am just showing the 2 methods that are available

    var availability = await FlutterNfcKit.nfcAvailability;
    return availability == NFCAvailability.available;
  }


  //   void _startNfcScan() {
  //   Flutter.readNfc().listen((NfcData data) {
  //     // Handle the scanned NFC data here
  //     // You can open an app or perform any other action based on the scanned data
  //     print('NFC Data: ${data.content}');
      
  //     // Replace 'com.example.yourapp' with your app's package name
  //     NfcKit.launchApp('com.example.yourapp');
  //   });
  // }
}
