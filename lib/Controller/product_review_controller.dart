import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewController extends GetxController {
  late PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  List<String> list = [
    'assets/images/Bottle.png',
    'assets/images/Bottle.png',
    'assets/images/Bottle.png',
    'assets/images/Bottle.png',
    'assets/images/Bottle.png',
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.dispose();
  }
}
