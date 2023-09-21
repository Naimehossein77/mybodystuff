import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'package:get/get.dart';

import '../constants.dart';

class Dialogs {
  //make it singleTone class
  static final Dialogs _singleton = Dialogs._internal();
  factory Dialogs() {
    return _singleton;
  }
  Dialogs._internal();

  tariffPopUp() {
    Get.dialog(
        AlertDialog(
          backgroundColor: kscaffoldBackgroundColor,
          contentPadding: EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
          content: Container(
            padding: EdgeInsets.all(20.w),
            height: 490.h,
            width: 348.w,
            decoration: BoxDecoration(),

         
          ),
        ),
        barrierDismissible: false);
  }

  
}
