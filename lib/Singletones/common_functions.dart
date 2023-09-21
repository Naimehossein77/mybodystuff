// import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import 'package:uuid/uuid.dart';

import '../Utils/toastUtils.dart';
import 'dialogs.dart';

class CommonFunctions {
  //make it singleTone class
  static final CommonFunctions _singleton = CommonFunctions._internal();
  factory CommonFunctions() {
    return _singleton;
  }
  CommonFunctions._internal();
  //code starts from here
}
