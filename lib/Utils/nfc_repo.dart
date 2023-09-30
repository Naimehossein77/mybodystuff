import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:mybodystuff/Model/productModel.dart';
import 'package:mybodystuff/Utils/firebase_repo.dart';
import 'package:mybodystuff/Utils/routes.dart';
import 'package:mybodystuff/Utils/toastUtils.dart';
import 'package:mybodystuff/Utils/utils.dart';
import 'package:ndef/ndef.dart';
import 'package:nfc_manager/nfc_manager.dart';

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

    // var availability = await FlutterNfcKit.nfcAvailability;
    // return availability == NFCAvailability.available;
    bool isAvailable = await NfcManager.instance.isAvailable();
    return isAvailable;
  }

  //READ NFC
  readNFC() async {
    // read NDEF records if available
    // timeout only works on Android, while the latter two messages are only for iOS
    try {
      // if (!(await isNfcSupported())) {
      //   showError(
      //       'Either NFC not turned on or this device does not support NFC!');
      //   return;
      // }
      // var tag = await FlutterNfcKit.poll(
      //     timeout: const Duration(seconds: 24 * 3600),
      //     iosMultipleTagMessage: "Multiple tags found!",
      //     iosAlertMessage: "Scan your tag");
      // if (tag.ndefAvailable!) {
      //   /// decoded NDEF records (see [ndef.NDEFRecord] for details)
      //   /// `UriRecord: id=(empty) typeNameFormat=TypeNameFormat.nfcWellKnown type=U uri=https://github.com/nfcim/ndef`
      //   for (NDEFRecord record
      //       in await FlutterNfcKit.readNDEFRecords(cached: false)) {
      //     log(record.toString());
      //     String text = String.fromCharCodes(record.payload ?? []);
      //     if (text.isNotEmpty) {
      //       List<String> prod = text.split(',');

      //       showLoading('Saving Product ${prod[2]}...');
      //       await FirebaseRepo().saveProduct(ProductModel(
      //           deviceId: await getDeviceId(),
      //           prodId: prod[0].replaceAll('en', ''),
      //           prodName: prod[2],
      //           prodSerialNumber: prod[1]));
      //       hideLoading();
      //       Get.offAllNamed(Routes.splashpageRoute, arguments: prod[0]);
      //     }
      //   }

      //   /// raw NDEF records (data in hex string)
      //   /// `{identifier: "", payload: "00010203", type: "0001", typeNameFormat: "nfcWellKnown"}`
      //   for (NDEFRawRecord record
      //       in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
      //     log(jsonEncode(record).toString());
      //   }
      // }
      // FlutterNfcKit.finish();
      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        if (!(await isNfcSupported())) return;
        // Do something with an NfcTag instance.
        Ndef? ndef = Ndef.from(tag);
        if (ndef == null) {
          throw Exception('Tag is not compatible with NDEF');
        }
        NdefMessage message = await ndef.read();
        if (message.records.isEmpty) {
          showError('Tag is empty!');
          throw Exception('Tag is empty');
        } else {
          String text = String.fromCharCodes(message.records.first.payload);
          if (text.isNotEmpty) {
            List<String> prod = text.split(',');
            showLoading('Saving Product ${prod[2]}...');
            await FirebaseRepo().saveProduct(ProductModel(
                deviceId: await getDeviceId(),
                prodId: prod[0].replaceAll('en', ''),
                prodName: prod[2],
                prodSerialNumber: prod[1]));
            hideLoading();
            Get.toNamed(Routes.splashpageRoute, arguments: prod[0]);
          }
        }
      });
    } on Exception catch (e) {
      log(e.toString());
      hideLoading();
      showError(e.toString());
    }
  }

  stopSession() async {
    await NfcManager.instance.stopSession();
  }
}
