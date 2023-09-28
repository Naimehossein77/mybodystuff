import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart';

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

  //READ NFC
  readNFC() async {
    // read NDEF records if available
    // timeout only works on Android, while the latter two messages are only for iOS
    var tag = await FlutterNfcKit.poll(
        timeout: const Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag");
    if (tag.ndefAvailable!) {
      /// decoded NDEF records (see [ndef.NDEFRecord] for details)
      /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
      for (NDEFRecord record
          in await FlutterNfcKit.readNDEFRecords(cached: false)) {
        log(record.toString());
        record.basicInfoString;
      }

      /// raw NDEF records (data in hex string)
      /// `{identifier: "", payload: "00010203", type: "0001", typeNameFormat: "nfcWellKnown"}`
      for (NDEFRawRecord record
          in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
        print(jsonEncode(record).toString());
      }
    }
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
